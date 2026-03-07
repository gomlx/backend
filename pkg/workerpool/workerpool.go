// Copyright 2025 The go-highway Authors. SPDX-License-Identifier: Apache-2.0

// Package workerpool provides a persistent, reusable worker pool for parallel
// computation. Unlike per-call goroutine spawning, a Pool is created once and
// reused across many operations, eliminating allocation and spawn overhead.
//
// This is critical for performance in transformer inference where ~50+ matrix
// multiplications occur per forward pass. Per-call channel allocation and
// goroutine spawning dominates compute time for smaller matrices.
//
// Usage:
//
//	pool := workerpool.New(runtime.GOMAXPROCS(0))
//	defer pool.Close()
//
//	// Reuse pool across many operations
//	for _, layer := range layers {
//	    pool.ParallelFor(m, func(start, end int) {
//	        processRows(start, end)
//	    })
//	}
package workerpool

import (
	"runtime"
	"sync"
	"sync/atomic"
)

// Pool is a persistent worker pool that can be reused across many parallel
// operations. Workers are spawned once at creation and reused.
//
// It supports two usage patterns:
//  1. ParallelFor / ParallelForAtomic: structured parallel iteration via the
//     persistent worker goroutines (channel-based dispatch).
//  2. StartIfAvailable / WaitToStart / Saturate: ad-hoc goroutine spawning with
//     a soft parallelism limit (mutex-based tracking).
type Pool struct {
	numWorkers int
	workC      chan workItem
	closeOnce  sync.Once
	closed     atomic.Bool

	// maxParallelism is a soft target on the limit of parallel work.
	// Used by StartIfAvailable / WaitToStart / Saturate.
	// Defaults to numWorkers.
	maxParallelism int
	mu             sync.Mutex
	cond           sync.Cond
	numRunning     int

	// extraParallelism is temporarily increased when a worker goes to sleep.
	extraParallelism atomic.Int32
}

// workItem represents a single parallel operation to execute.
type workItem struct {
	fn      func()
	barrier *sync.WaitGroup
}

// New creates a new worker pool with the specified number of workers.
// Workers are spawned immediately and persist until Close is called.
// If numWorkers <= 0, uses GOMAXPROCS.
func New(numWorkers int) *Pool {
	if numWorkers <= 0 {
		numWorkers = runtime.GOMAXPROCS(0)
	}

	p := &Pool{
		numWorkers:     numWorkers,
		maxParallelism: numWorkers,
		// Buffer enough for all workers to have pending work
		workC: make(chan workItem, numWorkers*2),
	}
	p.cond = sync.Cond{L: &p.mu}

	// Spawn persistent workers
	for range numWorkers {
		go p.worker()
	}

	return p
}

// worker is the main loop for each persistent worker goroutine.
func (p *Pool) worker() {
	for item := range p.workC {
		item.fn()
		item.barrier.Done()
	}
}

// NumWorkers returns the number of workers in the pool.
func (p *Pool) NumWorkers() int {
	return p.numWorkers
}

// Close shuts down the worker pool. All pending work will complete.
// Calling Close multiple times is safe.
func (p *Pool) Close() {
	p.closeOnce.Do(func() {
		p.closed.Store(true)
		close(p.workC)
	})
}

// ParallelFor executes fn for each index in [0, n) using the worker pool.
// Each worker processes a contiguous range of indices.
// Blocks until all work completes.
//
// fn receives (start, end) indices where work should process [start, end).
func (p *Pool) ParallelFor(n int, fn func(start, end int)) {
	if n <= 0 {
		return
	}

	if p.closed.Load() {
		// Fallback to sequential if pool is closed
		fn(0, n)
		return
	}

	// Determine number of workers to use (don't use more workers than items)
	workers := min(p.numWorkers, n)

	// For very small n, just run sequentially
	if workers == 1 {
		fn(0, n)
		return
	}

	// Calculate chunk size (ensure all items are covered)
	chunkSize := (n + workers - 1) / workers

	var wg sync.WaitGroup
	wg.Add(workers)

	for i := range workers {
		start := i * chunkSize
		end := min(start+chunkSize, n)
		if start >= n {
			// No work for this worker
			wg.Done()
			continue
		}

		p.workC <- workItem{
			fn: func() {
				fn(start, end)
			},
			barrier: &wg,
		}
	}

	wg.Wait()
}

// ParallelForAtomic executes fn for each index in [0, n) using atomic work
// stealing. This provides better load balancing when work per item varies.
// Blocks until all work completes.
//
// fn receives the index to process.
func (p *Pool) ParallelForAtomic(n int, fn func(i int)) {
	if n <= 0 {
		return
	}

	if p.closed.Load() {
		// Fallback to sequential if pool is closed
		for i := range n {
			fn(i)
		}
		return
	}

	workers := min(p.numWorkers, n)

	if workers == 1 {
		for i := range n {
			fn(i)
		}
		return
	}

	var nextIdx atomic.Int32
	var wg sync.WaitGroup
	wg.Add(workers)

	for range workers {
		p.workC <- workItem{
			fn: func() {
				for {
					idx := int(nextIdx.Add(1)) - 1
					if idx >= n {
						return
					}
					fn(idx)
				}
			},
			barrier: &wg,
		}
	}

	wg.Wait()
}

// ParallelForAtomicBatched executes fn for batches of indices using atomic
// work stealing. Combines the load balancing of atomic distribution with
// reduced atomic operation overhead by processing multiple items per grab.
//
// fn receives (start, end) indices where work should process [start, end).
// batchSize controls how many items are grabbed per atomic operation.
func (p *Pool) ParallelForAtomicBatched(n int, batchSize int, fn func(start, end int)) {
	if n <= 0 {
		return
	}

	if batchSize <= 0 {
		batchSize = 1
	}

	if p.closed.Load() {
		fn(0, n)
		return
	}

	// Calculate number of batches
	numBatches := (n + batchSize - 1) / batchSize
	workers := min(p.numWorkers, numBatches)

	if workers == 1 {
		fn(0, n)
		return
	}

	var nextBatch atomic.Int32
	var wg sync.WaitGroup
	wg.Add(workers)

	for range workers {
		p.workC <- workItem{
			fn: func() {
				for {
					batch := int(nextBatch.Add(1)) - 1
					start := batch * batchSize
					if start >= n {
						return
					}
					end := min(start+batchSize, n)
					fn(start, end)
				}
			},
			barrier: &wg,
		}
	}

	wg.Wait()
}

// --- Ad-hoc goroutine spawning with parallelism limit ---
//
// These methods provide a mutex-based approach for spawning goroutines with
// a soft parallelism cap, used by the simplego backend for batch-level
// parallelism and by packgemm for tiled GEMM.

// IsEnabled returns whether parallelism is enabled (maxParallelism != 0).
func (p *Pool) IsEnabled() bool {
	return p.maxParallelism != 0
}

// IsUnlimited returns whether parallelism is unlimited (maxParallelism < 0).
func (p *Pool) IsUnlimited() bool {
	return p.maxParallelism < 0
}

// MaxParallelism returns the soft-target for parallelism.
// If set to 0 parallelism is disabled.
// If set to -1 parallelism is unlimited.
func (p *Pool) MaxParallelism() int {
	return p.maxParallelism
}

// AdjustedMaxParallelism returns the adjusted soft-target for parallelism (>= 1).
//
// If the target is set to -1 (unlimited parallelism) it returns runtime.GOMAXPROCS.
// If the target is 0 (no parallelism) it returns 1.
//
// Also, it limits the number of workers to runtime.GOMAXPROCS.
func (p *Pool) AdjustedMaxParallelism() int {
	if p.maxParallelism < 0 {
		return runtime.GOMAXPROCS(0)
	}
	return min(max(p.maxParallelism, 1), runtime.GOMAXPROCS(0))
}

// SetMaxParallelism sets the maxParallelism.
//
// You should only change the parallelism before any workers start running.
// If changed during the execution the behavior is undefined.
func (p *Pool) SetMaxParallelism(maxParallelism int) {
	p.maxParallelism = maxParallelism
}

// lockedIsFull returns whether all available workers are in use.
// Must be called with p.mu held.
func (p *Pool) lockedIsFull() bool {
	if p.maxParallelism == 0 {
		return true
	} else if p.maxParallelism < 0 {
		return false
	}
	return p.numRunning >= p.maxParallelism+int(p.extraParallelism.Load())
}

// WaitToStart waits until there is a worker available, then runs task in a goroutine.
//
// If parallelism is disabled (maxParallelism is 0), it runs the task inline.
func (p *Pool) WaitToStart(task func()) {
	if p.IsUnlimited() {
		go task()
		return
	} else if p.maxParallelism == 0 {
		task()
		return
	}

	p.mu.Lock()
	defer p.mu.Unlock()
	for p.lockedIsFull() {
		p.cond.Wait()
	}
	p.lockedRunTaskInGoroutine(task)
}

// lockedRunTaskInGoroutine spawns a goroutine that runs task and tracks numRunning.
// Must be called with p.mu held.
func (p *Pool) lockedRunTaskInGoroutine(task func()) {
	p.numRunning++
	go func() {
		task()
		p.mu.Lock()
		p.numRunning--
		p.cond.Signal()
		p.mu.Unlock()
	}()
}

// StartIfAvailable runs the task in a separate goroutine if there are enough workers.
// Returns true if the task was started, false otherwise.
//
// It's up to the caller to synchronize the end of the task execution.
func (p *Pool) StartIfAvailable(task func()) bool {
	if p.IsUnlimited() {
		go task()
		return true
	}
	p.mu.Lock()
	defer p.mu.Unlock()
	if p.lockedIsFull() {
		return false
	}
	p.lockedRunTaskInGoroutine(task)
	return true
}

// Saturate fans out as many workers as available, each running the given task.
// It keeps spawning workers if more workers become available.
//
// When the first task finishes, it indicates there is no more work to be done,
// and it stops spawning new tasks.
//
// It returns when all started tasks have finished.
func (p *Pool) Saturate(task func()) {
	if p.maxParallelism == 0 {
		task()
		return
	}

	limit := p.maxParallelism
	if limit < 0 {
		limit = runtime.GOMAXPROCS(0)
	}

	var wg sync.WaitGroup
	var doneFanningOut atomic.Bool

	p.mu.Lock()
	started := 0

	for !doneFanningOut.Load() {
		if (p.IsUnlimited() && started >= limit) || (!p.IsUnlimited() && p.lockedIsFull()) {
			p.cond.Wait()
			if doneFanningOut.Load() {
				p.cond.Signal()
				break
			}
			continue
		}

		started++
		wg.Add(1)
		p.lockedRunTaskInGoroutine(func() {
			defer wg.Done()
			task()
			doneFanningOut.Store(true)
		})
	}
	p.mu.Unlock()
	wg.Wait()
}

// WorkerIsAsleep indicates the worker is going to sleep waiting for other
// workers, and temporarily increases the available number of workers.
//
// Call WorkerRestarted when the worker is ready to run again.
func (p *Pool) WorkerIsAsleep() {
	p.extraParallelism.Add(1)
}

// WorkerRestarted indicates the worker is ready to run again.
// It should only be called after WorkerIsAsleep.
func (p *Pool) WorkerRestarted() {
	p.extraParallelism.Add(-1)
}
