// Copyright 2025 go-highway Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package nn

import (
	"fmt"
	stdmath "math"
	"runtime"
	"testing"

	"github.com/gomlx/backend/pkg/workerpool"
)

// newTestPool returns a worker pool sized to the machine.
func newParallelTestPool(tb testing.TB) *workerpool.Pool {
	tb.Helper()
	pool := workerpool.New(runtime.NumCPU())
	tb.Cleanup(pool.Close)
	return pool
}

// randParallelData fills a float32 slice with deterministic pseudo-random values.
func randParallelData(n int) []float32 {
	data := make([]float32, n)
	for i := range data {
		data[i] = float32(i)*0.01 - float32(n)*0.005
	}
	return data
}

// randParallelData64 fills a float64 slice with deterministic pseudo-random values.
func randParallelData64(n int) []float64 {
	data := make([]float64, n)
	for i := range data {
		data[i] = float64(i)*0.01 - float64(n)*0.005
	}
	return data
}

// assertParallelClose checks that two float32 slices match within tolerance.
func assertParallelClose(t *testing.T, name string, got, want []float32, tol float64) {
	t.Helper()
	if len(got) != len(want) {
		t.Fatalf("%s: length mismatch: got %d, want %d", name, len(got), len(want))
	}
	for i := range got {
		if stdmath.Abs(float64(got[i]-want[i])) > tol {
			t.Errorf("%s[%d]: got %v, want %v (diff %v)", name, i, got[i], want[i], got[i]-want[i])
			if i > 5 {
				t.Fatalf("%s: too many mismatches, stopping", name)
			}
		}
	}
}

var parallelTestSizes = []struct {
	rows, cols int
}{
	{1, 8},
	{4, 4},
	{16, 256},
	{64, 1024},
	{128, 4096},
}

// ---------------------------------------------------------------------------
// Softmax correctness tests
// ---------------------------------------------------------------------------

func TestParallelSoftmax(t *testing.T) {
	pool := newParallelTestPool(t)
	for _, sz := range parallelTestSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randParallelData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				Softmax(input[off:off+sz.cols], want[off:off+sz.cols])
			}
			ParallelSoftmax(pool, input, got, sz.rows, sz.cols)
			assertParallelClose(t, "ParallelSoftmax", got, want, 0)
		})
	}
}

func TestParallelSoftmaxNilPool(t *testing.T) {
	input := randParallelData(64)
	want := make([]float32, 64)
	got := make([]float32, 64)

	for r := range 8 {
		off := r * 8
		Softmax(input[off:off+8], want[off:off+8])
	}
	ParallelSoftmax[float32](nil, input, got, 8, 8)
	assertParallelClose(t, "ParallelSoftmax/nil", got, want, 0)
}

func TestParallelLogSoftmax(t *testing.T) {
	pool := newParallelTestPool(t)
	for _, sz := range parallelTestSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randParallelData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				LogSoftmax(input[off:off+sz.cols], want[off:off+sz.cols])
			}
			ParallelLogSoftmax(pool, input, got, sz.rows, sz.cols)
			assertParallelClose(t, "ParallelLogSoftmax", got, want, 0)
		})
	}
}

func TestParallelSoftmaxWithTemperature(t *testing.T) {
	pool := newParallelTestPool(t)
	const temp float32 = 0.5
	for _, sz := range parallelTestSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randParallelData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				SoftmaxWithTemperature(input[off:off+sz.cols], want[off:off+sz.cols], temp)
			}
			ParallelSoftmaxWithTemperature(pool, input, got, sz.rows, sz.cols, temp)
			assertParallelClose(t, "ParallelSoftmaxWithTemperature", got, want, 0)
		})
	}
}

func TestParallelSoftmaxWithTemperatureNilPool(t *testing.T) {
	const temp float32 = 0.5
	input := randParallelData(64)
	want := make([]float32, 64)
	got := make([]float32, 64)

	for r := range 8 {
		off := r * 8
		SoftmaxWithTemperature(input[off:off+8], want[off:off+8], temp)
	}
	ParallelSoftmaxWithTemperature[float32](nil, input, got, 8, 8, temp)
	assertParallelClose(t, "ParallelSoftmaxWithTemperature/nil", got, want, 0)
}

// ---------------------------------------------------------------------------
// LayerNorm correctness tests
// ---------------------------------------------------------------------------

func TestParallelLayerNorm(t *testing.T) {
	pool := newParallelTestPool(t)

	normSizes := []int{4, 64, 256}
	for _, normSize := range normSizes {
		for _, numGroups := range []int{1, 8, 64, 128} {
			t.Run(fmt.Sprintf("norm=%d/groups=%d", normSize, numGroups), func(t *testing.T) {
				n := numGroups * normSize
				input := randParallelData(n)
				gamma := make([]float32, normSize)
				beta := make([]float32, normSize)
				for i := range gamma {
					gamma[i] = 1.0 + float32(i)*0.01
					beta[i] = float32(i) * 0.005
				}

				want := make([]float32, n)
				got := make([]float32, n)

				LayerNorm(input, want, normSize, gamma, beta, 1e-5)
				ParallelLayerNorm(pool, input, got, normSize, gamma, beta, 1e-5)
				assertParallelClose(t, "ParallelLayerNorm", got, want, 1e-6)
			})
		}
	}
}

func TestParallelLayerNormNilPool(t *testing.T) {
	normSize := 16
	numGroups := 4
	n := numGroups * normSize
	input := randParallelData(n)
	gamma := make([]float32, normSize)
	beta := make([]float32, normSize)
	for i := range gamma {
		gamma[i] = 1.0
		beta[i] = 0.0
	}

	want := make([]float32, n)
	got := make([]float32, n)

	LayerNorm(input, want, normSize, gamma, beta, 1e-5)
	ParallelLayerNorm[float32](nil, input, got, normSize, gamma, beta, 1e-5)
	assertParallelClose(t, "ParallelLayerNorm/nil", got, want, 1e-6)
}

func TestParallelLayerNormNoAffine(t *testing.T) {
	pool := newParallelTestPool(t)
	normSize := 64
	numGroups := 32
	n := numGroups * normSize
	input := randParallelData(n)

	want := make([]float32, n)
	got := make([]float32, n)

	LayerNorm[float32](input, want, normSize, nil, nil, 1e-5)
	ParallelLayerNorm[float32](pool, input, got, normSize, nil, nil, 1e-5)
	assertParallelClose(t, "ParallelLayerNorm/no_affine", got, want, 1e-6)
}

func TestParallelLayerNormEmpty(t *testing.T) {
	pool := newParallelTestPool(t)
	// Should not panic.
	ParallelLayerNorm[float32](pool, nil, nil, 4, nil, nil, 1e-5)
	ParallelLayerNorm(pool, []float32{}, []float32{}, 4, nil, nil, 1e-5)
}

// ---------------------------------------------------------------------------
// float64 tests
// ---------------------------------------------------------------------------

func TestParallelSoftmaxFloat64(t *testing.T) {
	pool := newParallelTestPool(t)
	rows, cols := 16, 64
	n := rows * cols
	input := randParallelData64(n)
	want := make([]float64, n)
	got := make([]float64, n)

	for r := range rows {
		off := r * cols
		Softmax(input[off:off+cols], want[off:off+cols])
	}
	ParallelSoftmax(pool, input, got, rows, cols)

	for i := range got {
		if got[i] != want[i] {
			t.Errorf("ParallelSoftmax/f64[%d]: got %v, want %v", i, got[i], want[i])
			break
		}
	}
}

// ---------------------------------------------------------------------------
// Benchmarks: sequential vs parallel
// ---------------------------------------------------------------------------

var parallelBenchSizes = []struct {
	rows, cols int
}{
	{16, 256},
	{64, 1024},
	{256, 4096},
}

func BenchmarkParallelSoftmax(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	for _, sz := range parallelBenchSizes {
		n := sz.rows * sz.cols
		input := randParallelData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				for r := range sz.rows {
					off := r * sz.cols
					Softmax(input[off:off+sz.cols], output[off:off+sz.cols])
				}
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelSoftmax(pool, input, output, sz.rows, sz.cols)
			}
		})
	}
}

func BenchmarkParallelLogSoftmax(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	for _, sz := range parallelBenchSizes {
		n := sz.rows * sz.cols
		input := randParallelData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				for r := range sz.rows {
					off := r * sz.cols
					LogSoftmax(input[off:off+sz.cols], output[off:off+sz.cols])
				}
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelLogSoftmax(pool, input, output, sz.rows, sz.cols)
			}
		})
	}
}

func BenchmarkParallelLayerNorm(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	for _, sz := range parallelBenchSizes {
		normSize := sz.cols
		numGroups := sz.rows
		n := numGroups * normSize
		input := randParallelData(n)
		output := make([]float32, n)
		gamma := make([]float32, normSize)
		beta := make([]float32, normSize)
		for i := range gamma {
			gamma[i] = 1.0
			beta[i] = 0.0
		}

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				LayerNorm(input, output, normSize, gamma, beta, 1e-5)
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelLayerNorm(pool, input, output, normSize, gamma, beta, 1e-5)
			}
		})
	}
}
