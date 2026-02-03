// Copyright 2023-2026 The GoMLX Authors. SPDX-License-Identifier: Apache-2.0

package simplego

import (
	"unsafe"

	"github.com/ajroetker/go-highway/hwy"
	"github.com/ajroetker/go-highway/hwy/contrib/algo"
	"github.com/gomlx/backend/pkg/matmul"
	"github.com/gomlx/backend/pkg/packgemm"
	"github.com/gomlx/backend/pkg/workerpool"
	"github.com/gomlx/gomlx/backends"
	"github.com/gomlx/gomlx/pkg/core/dtypes"
	"github.com/gomlx/gomlx/pkg/core/dtypes/bfloat16"
	"github.com/gomlx/gomlx/pkg/support/xsync"
	"github.com/pkg/errors"
	"github.com/x448/float16"
)

// hwyPool is the shared go-highway worker pool for intra-matrix parallelism.
var hwyPool *workerpool.Pool

func init() {
	// Create a shared highway worker pool for intra-matrix parallelism.
	// Pass 0 to use GOMAXPROCS workers.
	hwyPool = workerpool.New(0)

	// Register SIMD-accelerated unary operations with architecture priority.
	SetNodeExecutor(backends.OpTypeExp, RegisterPriorityArch, execExpHighway)
	SetNodeExecutor(backends.OpTypeLog, RegisterPriorityArch, execLogHighway)
	SetNodeExecutor(backends.OpTypeSin, RegisterPriorityArch, execSinHighway)
	SetNodeExecutor(backends.OpTypeCos, RegisterPriorityArch, execCosHighway)
	SetNodeExecutor(backends.OpTypeTanh, RegisterPriorityArch, execTanhHighway)
	SetNodeExecutor(backends.OpTypeLogistic, RegisterPriorityArch, execSigmoidHighway)
	SetNodeExecutor(backends.OpTypeErf, RegisterPriorityArch, execErfHighway)
}

// highwayHasDTypeSupport returns true if highway MatMul is available for the given dtypes.
func highwayHasDTypeSupport(input, output dtypes.DType) bool {
	switch input {
	case dtypes.Float32:
		return output == dtypes.Float32
	case dtypes.Float64:
		return output == dtypes.Float64
	case dtypes.Float16:
		return output == dtypes.Float16
	case dtypes.BFloat16:
		return output == dtypes.BFloat16
	}
	return false
}

// highwayTranspose2D transposes an M×K row-major matrix to K×M using SIMD.
// Returns false if the dtype is not supported.
func highwayTranspose2D(dtype dtypes.DType, src any, m, k int, dst any) bool {
	switch dtype {
	case dtypes.Float32:
		matmul.Transpose2DFloat32(src.([]float32), m, k, dst.([]float32))
		return true
	case dtypes.Float64:
		matmul.Transpose2DFloat64(src.([]float64), m, k, dst.([]float64))
		return true
	case dtypes.Float16:
		srcSlice := src.([]float16.Float16)
		dstSlice := dst.([]float16.Float16)
		srcHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(srcSlice))), len(srcSlice))
		dstHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(dstSlice))), len(dstSlice))
		matmul.Transpose2DFloat16(srcHwy, m, k, dstHwy)
		return true
	case dtypes.BFloat16:
		srcSlice := src.([]bfloat16.BFloat16)
		dstSlice := dst.([]bfloat16.BFloat16)
		srcHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(srcSlice))), len(srcSlice))
		dstHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(dstSlice))), len(dstSlice))
		matmul.Transpose2DBFloat16(srcHwy, m, k, dstHwy)
		return true
	default:
		return false
	}
}

// highwayMatMulDynamic dispatches the MatMul function for the given dtypes.
func highwayMatMulDynamic(inputDType, outputDType dtypes.DType,
	lhsFlat, rhsFlat any, batchSize,
	lhsCrossSize, rhsCrossSize, contractingSize int, outputFlat any,
	bufAllocAnyFn packgemm.BufAllocAnyFn, bufReleaseFn packgemm.BufReleaseFn, pool *workerpool.Pool) error {

	switch inputDType {
	case dtypes.Float32:
		if outputDType != dtypes.Float32 {
			return errors.Errorf("highway: input dtype Float32 requires output dtype Float32, got %s", outputDType)
		}
		return matMulFloat32(
			lhsFlat.([]float32), rhsFlat.([]float32), outputFlat.([]float32),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	case dtypes.Float64:
		if outputDType != dtypes.Float64 {
			return errors.Errorf("highway: input dtype Float64 requires output dtype Float64, got %s", outputDType)
		}
		return matMulFloat64(
			lhsFlat.([]float64), rhsFlat.([]float64), outputFlat.([]float64),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	case dtypes.Float16:
		if outputDType != dtypes.Float16 {
			return errors.Errorf("highway: input dtype Float16 requires output dtype Float16, got %s", outputDType)
		}
		return matMulFloat16(
			lhsFlat.([]float16.Float16), rhsFlat.([]float16.Float16), outputFlat.([]float16.Float16),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	case dtypes.BFloat16:
		if outputDType != dtypes.BFloat16 {
			return errors.Errorf("highway: input dtype BFloat16 requires output dtype BFloat16, got %s", outputDType)
		}
		return matMulBFloat16(
			lhsFlat.([]bfloat16.BFloat16), rhsFlat.([]bfloat16.BFloat16), outputFlat.([]bfloat16.BFloat16),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	default:
		return errors.Errorf("highway: unsupported input dtype %s", inputDType)
	}
}

// matMulFloat32 performs batched matrix multiplication for float32.
func matMulFloat32(lhs, rhs, output []float32, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsBatchStride := m * k
	rhsBatchStride := k * n
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulAuto(hwyPool, lhs, rhs, output, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulAuto(hwyPool,
				lhs[lhsStart:lhsStart+lhsBatchStride],
				rhs[rhsStart:rhsStart+rhsBatchStride],
				output[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// matMulFloat64 performs batched matrix multiplication for float64.
func matMulFloat64(lhs, rhs, output []float64, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsBatchStride := m * k
	rhsBatchStride := k * n
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulAuto(hwyPool, lhs, rhs, output, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulAuto(hwyPool,
				lhs[lhsStart:lhsStart+lhsBatchStride],
				rhs[rhsStart:rhsStart+rhsBatchStride],
				output[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// matMulFloat16 performs batched matrix multiplication for float16.
func matMulFloat16(lhs, rhs, output []float16.Float16, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(lhs))), len(lhs))
	rhsHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(rhs))), len(rhs))
	outputHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(output))), len(output))

	lhsBatchStride := m * k
	rhsBatchStride := k * n
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulAuto(hwyPool, lhsHwy, rhsHwy, outputHwy, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulAuto(hwyPool,
				lhsHwy[lhsStart:lhsStart+lhsBatchStride],
				rhsHwy[rhsStart:rhsStart+rhsBatchStride],
				outputHwy[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// matMulBFloat16 performs batched matrix multiplication for bfloat16.
func matMulBFloat16(lhs, rhs, output []bfloat16.BFloat16, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(lhs))), len(lhs))
	rhsHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(rhs))), len(rhs))
	outputHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(output))), len(output))

	lhsBatchStride := m * k
	rhsBatchStride := k * n
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulAuto(hwyPool, lhsHwy, rhsHwy, outputHwy, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulAuto(hwyPool,
				lhsHwy[lhsStart:lhsStart+lhsBatchStride],
				rhsHwy[rhsStart:rhsStart+rhsBatchStride],
				outputHwy[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// highwayMatMulKLast dispatches the MatMulKLast function for the given dtypes.
func highwayMatMulKLast(inputDType, outputDType dtypes.DType,
	lhsFlat, rhsFlat any, batchSize,
	lhsCrossSize, rhsCrossSize, contractingSize int, outputFlat any,
	pool *workerpool.Pool) error {

	switch inputDType {
	case dtypes.Float32:
		if outputDType != dtypes.Float32 {
			return errors.Errorf("highway: input dtype Float32 requires output dtype Float32, got %s", outputDType)
		}
		return matMulKLastFloat32(
			lhsFlat.([]float32), rhsFlat.([]float32), outputFlat.([]float32),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	case dtypes.Float64:
		if outputDType != dtypes.Float64 {
			return errors.Errorf("highway: input dtype Float64 requires output dtype Float64, got %s", outputDType)
		}
		return matMulKLastFloat64(
			lhsFlat.([]float64), rhsFlat.([]float64), outputFlat.([]float64),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	case dtypes.Float16:
		if outputDType != dtypes.Float16 {
			return errors.Errorf("highway: input dtype Float16 requires output dtype Float16, got %s", outputDType)
		}
		return matMulKLastFloat16(
			lhsFlat.([]float16.Float16), rhsFlat.([]float16.Float16), outputFlat.([]float16.Float16),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	case dtypes.BFloat16:
		if outputDType != dtypes.BFloat16 {
			return errors.Errorf("highway: input dtype BFloat16 requires output dtype BFloat16, got %s", outputDType)
		}
		return matMulKLastBFloat16(
			lhsFlat.([]bfloat16.BFloat16), rhsFlat.([]bfloat16.BFloat16), outputFlat.([]bfloat16.BFloat16),
			batchSize, lhsCrossSize, rhsCrossSize, contractingSize,
			pool)

	default:
		return errors.Errorf("highway: unsupported input dtype %s", inputDType)
	}
}

// matMulKLastFloat32 performs batched K-last matrix multiplication for float32.
func matMulKLastFloat32(lhs, rhs, output []float32, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsBatchStride := m * k
	rhsBatchStride := n * k
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulKLastAuto(hwyPool, lhs, rhs, output, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulKLastAuto(hwyPool,
				lhs[lhsStart:lhsStart+lhsBatchStride],
				rhs[rhsStart:rhsStart+rhsBatchStride],
				output[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// matMulKLastFloat64 performs batched K-last matrix multiplication for float64.
func matMulKLastFloat64(lhs, rhs, output []float64, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsBatchStride := m * k
	rhsBatchStride := n * k
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulKLastAuto(hwyPool, lhs, rhs, output, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulKLastAuto(hwyPool,
				lhs[lhsStart:lhsStart+lhsBatchStride],
				rhs[rhsStart:rhsStart+rhsBatchStride],
				output[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// matMulKLastFloat16 performs batched K-last matrix multiplication for float16.
func matMulKLastFloat16(lhs, rhs, output []float16.Float16, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(lhs))), len(lhs))
	rhsHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(rhs))), len(rhs))
	outputHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(output))), len(output))

	lhsBatchStride := m * k
	rhsBatchStride := n * k
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulKLastAuto(hwyPool, lhsHwy, rhsHwy, outputHwy, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulKLastAuto(hwyPool,
				lhsHwy[lhsStart:lhsStart+lhsBatchStride],
				rhsHwy[rhsStart:rhsStart+rhsBatchStride],
				outputHwy[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// matMulKLastBFloat16 performs batched K-last matrix multiplication for bfloat16.
func matMulKLastBFloat16(lhs, rhs, output []bfloat16.BFloat16, batchSize, m, n, k int, pool *workerpool.Pool) error {
	lhsHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(lhs))), len(lhs))
	rhsHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(rhs))), len(rhs))
	outputHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(output))), len(output))

	lhsBatchStride := m * k
	rhsBatchStride := n * k
	outBatchStride := m * n

	if batchSize == 1 {
		matmul.MatMulKLastAuto(hwyPool, lhsHwy, rhsHwy, outputHwy, m, n, k)
		return nil
	}

	wg := xsync.NewDynamicWaitGroup()
	for batchIdx := range batchSize {
		wg.Add(1)
		task := func() {
			lhsStart := batchIdx * lhsBatchStride
			rhsStart := batchIdx * rhsBatchStride
			outStart := batchIdx * outBatchStride
			matmul.MatMulKLastAuto(hwyPool,
				lhsHwy[lhsStart:lhsStart+lhsBatchStride],
				rhsHwy[rhsStart:rhsStart+rhsBatchStride],
				outputHwy[outStart:outStart+outBatchStride],
				m, n, k)
			wg.Done()
		}
		if pool == nil || !pool.StartIfAvailable(task) {
			task()
		}
	}
	wg.Wait()
	return nil
}

// --- SIMD-accelerated unary operations ---

// execExpHighway executes the Exp operation using SIMD.
func execExpHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	applyHighwayTransform(input, output, algo.ExpTransformFloat32, algo.ExpTransformFloat64,
		algo.ExpTransformFloat16, algo.ExpTransformBFloat16)
	return output, nil
}

// execLogHighway executes the Log operation using SIMD.
func execLogHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	applyHighwayTransform(input, output, algo.LogTransformFloat32, algo.LogTransformFloat64,
		algo.LogTransformFloat16, algo.LogTransformBFloat16)
	return output, nil
}

// execSinHighway executes the Sin operation using SIMD.
func execSinHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	applyHighwayTransform(input, output, algo.SinTransformFloat32, algo.SinTransformFloat64,
		algo.SinTransformFloat16, algo.SinTransformBFloat16)
	return output, nil
}

// execCosHighway executes the Cos operation using SIMD.
func execCosHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	applyHighwayTransform(input, output, algo.CosTransformFloat32, algo.CosTransformFloat64,
		algo.CosTransformFloat16, algo.CosTransformBFloat16)
	return output, nil
}

// execTanhHighway executes the Tanh operation using SIMD.
func execTanhHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	applyHighwayTransform(input, output, algo.TanhTransformFloat32, algo.TanhTransformFloat64,
		algo.TanhTransformFloat16, algo.TanhTransformBFloat16)
	return output, nil
}

// execSigmoidHighway executes the Logistic (sigmoid) operation using SIMD.
func execSigmoidHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	applyHighwayTransform(input, output, algo.SigmoidTransformFloat32, algo.SigmoidTransformFloat64,
		algo.SigmoidTransformFloat16, algo.SigmoidTransformBFloat16)
	return output, nil
}

// execErfHighway executes the Erf operation using SIMD.
func execErfHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	applyHighwayTransform(input, output, algo.ErfTransformFloat32, algo.ErfTransformFloat64,
		algo.ErfTransformFloat16, algo.ErfTransformBFloat16)
	return output, nil
}

// applyHighwayTransform applies the appropriate SIMD transform based on the input dtype.
func applyHighwayTransform(input, output *Buffer,
	f32Fn func([]float32, []float32),
	f64Fn func([]float64, []float64),
	f16Fn func([]hwy.Float16, []hwy.Float16),
	bf16Fn func([]hwy.BFloat16, []hwy.BFloat16)) {

	switch input.DType() {
	case dtypes.Float32:
		f32Fn(input.Flat().([]float32), output.Flat().([]float32))
	case dtypes.Float64:
		f64Fn(input.Flat().([]float64), output.Flat().([]float64))
	case dtypes.Float16:
		inSlice := input.Flat().([]float16.Float16)
		outSlice := output.Flat().([]float16.Float16)
		inHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(inSlice))), len(inSlice))
		outHwy := unsafe.Slice((*hwy.Float16)(unsafe.Pointer(unsafe.SliceData(outSlice))), len(outSlice))
		f16Fn(inHwy, outHwy)
	case dtypes.BFloat16:
		inSlice := input.Flat().([]bfloat16.BFloat16)
		outSlice := output.Flat().([]bfloat16.BFloat16)
		inHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(inSlice))), len(inSlice))
		outHwy := unsafe.Slice((*hwy.BFloat16)(unsafe.Pointer(unsafe.SliceData(outSlice))), len(outSlice))
		bf16Fn(inHwy, outHwy)
	}
}
