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

package activation

import (
	"fmt"
	stdmath "math"
	"runtime"
	"testing"

	"github.com/gomlx/backend/pkg/workerpool"
)

// newTestPool returns a worker pool sized to the machine.
func newTestPool(tb testing.TB) *workerpool.Pool {
	tb.Helper()
	pool := workerpool.New(runtime.NumCPU())
	tb.Cleanup(pool.Close)
	return pool
}

// randData fills a float32 slice with deterministic pseudo-random values.
func randData(n int) []float32 {
	data := make([]float32, n)
	for i := range data {
		data[i] = float32(i)*0.01 - float32(n)*0.005
	}
	return data
}

// randData64 fills a float64 slice with deterministic pseudo-random values.
func randData64(n int) []float64 {
	data := make([]float64, n)
	for i := range data {
		data[i] = float64(i)*0.01 - float64(n)*0.005
	}
	return data
}

// assertClose checks that two float32 slices match within tolerance.
func assertClose(t *testing.T, name string, got, want []float32, tol float64) {
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

var testSizes = []struct {
	rows, cols int
}{
	{1, 8},
	{4, 4},
	{16, 256},
	{64, 1024},
	{128, 4096},
}

// ---------------------------------------------------------------------------
// Activation correctness tests
// ---------------------------------------------------------------------------

func TestParallelGELU(t *testing.T) {
	pool := newTestPool(t)
	for _, sz := range testSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				GELU(input[off:off+sz.cols], want[off:off+sz.cols])
			}
			ParallelGELU(pool, input, got, sz.rows, sz.cols)
			assertClose(t, "ParallelGELU", got, want, 0)
		})
	}
}

func TestParallelGELUNilPool(t *testing.T) {
	input := randData(64)
	want := make([]float32, 64)
	got := make([]float32, 64)

	for r := range 8 {
		off := r * 8
		GELU(input[off:off+8], want[off:off+8])
	}
	ParallelGELU[float32](nil, input, got, 8, 8)
	assertClose(t, "ParallelGELU/nil", got, want, 0)
}

func TestParallelGELUApprox(t *testing.T) {
	pool := newTestPool(t)
	for _, sz := range testSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				GELUApprox(input[off:off+sz.cols], want[off:off+sz.cols])
			}
			ParallelGELUApprox(pool, input, got, sz.rows, sz.cols)
			assertClose(t, "ParallelGELUApprox", got, want, 0)
		})
	}
}

func TestParallelReLU(t *testing.T) {
	pool := newTestPool(t)
	for _, sz := range testSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				ReLU(input[off:off+sz.cols], want[off:off+sz.cols])
			}
			ParallelReLU(pool, input, got, sz.rows, sz.cols)
			assertClose(t, "ParallelReLU", got, want, 0)
		})
	}
}

func TestParallelReLUNilPool(t *testing.T) {
	input := randData(64)
	want := make([]float32, 64)
	got := make([]float32, 64)

	for r := range 8 {
		off := r * 8
		ReLU(input[off:off+8], want[off:off+8])
	}
	ParallelReLU[float32](nil, input, got, 8, 8)
	assertClose(t, "ParallelReLU/nil", got, want, 0)
}

func TestParallelSiLU(t *testing.T) {
	pool := newTestPool(t)
	for _, sz := range testSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				SiLU(input[off:off+sz.cols], want[off:off+sz.cols])
			}
			ParallelSiLU(pool, input, got, sz.rows, sz.cols)
			assertClose(t, "ParallelSiLU", got, want, 0)
		})
	}
}

func TestParallelTanh(t *testing.T) {
	pool := newTestPool(t)
	for _, sz := range testSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				Tanh(input[off:off+sz.cols], want[off:off+sz.cols])
			}
			ParallelTanh(pool, input, got, sz.rows, sz.cols)
			assertClose(t, "ParallelTanh", got, want, 0)
		})
	}
}

func TestParallelLeakyReLU(t *testing.T) {
	pool := newTestPool(t)
	const alpha float32 = 0.01
	for _, sz := range testSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				LeakyReLU(input[off:off+sz.cols], want[off:off+sz.cols], alpha)
			}
			ParallelLeakyReLU(pool, input, got, sz.rows, sz.cols, alpha)
			assertClose(t, "ParallelLeakyReLU", got, want, 0)
		})
	}
}

func TestParallelLeakyReLUNilPool(t *testing.T) {
	const alpha float32 = 0.01
	input := randData(64)
	want := make([]float32, 64)
	got := make([]float32, 64)

	for r := range 8 {
		off := r * 8
		LeakyReLU(input[off:off+8], want[off:off+8], alpha)
	}
	ParallelLeakyReLU[float32](nil, input, got, 8, 8, alpha)
	assertClose(t, "ParallelLeakyReLU/nil", got, want, 0)
}

func TestParallelELU(t *testing.T) {
	pool := newTestPool(t)
	const alpha float32 = 1.0
	for _, sz := range testSizes {
		t.Run(fmt.Sprintf("%dx%d", sz.rows, sz.cols), func(t *testing.T) {
			n := sz.rows * sz.cols
			input := randData(n)
			want := make([]float32, n)
			got := make([]float32, n)

			for r := range sz.rows {
				off := r * sz.cols
				ELU(input[off:off+sz.cols], want[off:off+sz.cols], alpha)
			}
			ParallelELU(pool, input, got, sz.rows, sz.cols, alpha)
			assertClose(t, "ParallelELU", got, want, 0)
		})
	}
}

func TestParallelELUNilPool(t *testing.T) {
	const alpha float32 = 1.0
	input := randData(64)
	want := make([]float32, 64)
	got := make([]float32, 64)

	for r := range 8 {
		off := r * 8
		ELU(input[off:off+8], want[off:off+8], alpha)
	}
	ParallelELU[float32](nil, input, got, 8, 8, alpha)
	assertClose(t, "ParallelELU/nil", got, want, 0)
}

// ---------------------------------------------------------------------------
// float64 test
// ---------------------------------------------------------------------------

func TestParallelGELUFloat64(t *testing.T) {
	pool := newTestPool(t)
	rows, cols := 16, 256
	n := rows * cols
	input := randData64(n)
	want := make([]float64, n)
	got := make([]float64, n)

	for r := range rows {
		off := r * cols
		GELU(input[off:off+cols], want[off:off+cols])
	}
	ParallelGELU(pool, input, got, rows, cols)

	for i := range got {
		if got[i] != want[i] {
			t.Errorf("ParallelGELU/f64[%d]: got %v, want %v", i, got[i], want[i])
			break
		}
	}
}

// ---------------------------------------------------------------------------
// Benchmarks: sequential vs parallel
// ---------------------------------------------------------------------------

var benchSizes = []struct {
	rows, cols int
}{
	{16, 256},
	{64, 1024},
	{256, 4096},
}

func BenchmarkParallelGELU(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	for _, sz := range benchSizes {
		n := sz.rows * sz.cols
		input := randData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				GELU(input, output)
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelGELU(pool, input, output, sz.rows, sz.cols)
			}
		})
	}
}

func BenchmarkParallelReLU(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	for _, sz := range benchSizes {
		n := sz.rows * sz.cols
		input := randData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ReLU(input, output)
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelReLU(pool, input, output, sz.rows, sz.cols)
			}
		})
	}
}

func BenchmarkParallelSiLU(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	for _, sz := range benchSizes {
		n := sz.rows * sz.cols
		input := randData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				SiLU(input, output)
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelSiLU(pool, input, output, sz.rows, sz.cols)
			}
		})
	}
}

func BenchmarkParallelTanh(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	for _, sz := range benchSizes {
		n := sz.rows * sz.cols
		input := randData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				Tanh(input, output)
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelTanh(pool, input, output, sz.rows, sz.cols)
			}
		})
	}
}

func BenchmarkParallelLeakyReLU(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	const alpha float32 = 0.01
	for _, sz := range benchSizes {
		n := sz.rows * sz.cols
		input := randData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				LeakyReLU(input, output, alpha)
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelLeakyReLU(pool, input, output, sz.rows, sz.cols, alpha)
			}
		})
	}
}

func BenchmarkParallelELU(b *testing.B) {
	pool := workerpool.New(runtime.NumCPU())
	defer pool.Close()

	const alpha float32 = 1.0
	for _, sz := range benchSizes {
		n := sz.rows * sz.cols
		input := randData(n)
		output := make([]float32, n)

		b.Run(fmt.Sprintf("Sequential/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ELU(input, output, alpha)
			}
		})
		b.Run(fmt.Sprintf("Parallel/%dx%d", sz.rows, sz.cols), func(b *testing.B) {
			for i := 0; i < b.N; i++ {
				ParallelELU(pool, input, output, sz.rows, sz.cols, alpha)
			}
		})
	}
}
