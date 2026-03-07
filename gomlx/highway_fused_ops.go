// Copyright 2023-2026 The GoMLX Authors. SPDX-License-Identifier: Apache-2.0

package simplego

import (
	"github.com/gomlx/backend/pkg/activation"
	"github.com/gomlx/backend/pkg/matmul"
	"github.com/gomlx/backend/pkg/nn"
	"github.com/gomlx/gomlx/backends"
	"github.com/gomlx/gomlx/pkg/core/dtypes"
	"github.com/gomlx/gomlx/pkg/core/shapes"
	"github.com/pkg/errors"
)

func init() {
	SetNodeExecutor(backends.OpTypeFusedSoftmax, RegisterPriorityArch, execSoftmaxHighway)
	SetNodeExecutor(backends.OpTypeFusedGelu, RegisterPriorityArch, execGeluHighway)
	SetNodeExecutor(backends.OpTypeFusedLayerNorm, RegisterPriorityArch, execLayerNormHighway)
	SetNodeExecutor(backends.OpTypeFusedDense, RegisterPriorityArch, execDenseActivationHighway)
	SetNodeExecutor(backends.OpTypeFusedMultiHeadSDPA, RegisterPriorityArch, execMultiHeadSDPAHighway)
	SetMultiOutputsNodeExecutor(backends.OpTypeFusedQKVDense, RegisterPriorityArch, execQKVDenseHighway)
}

// rowColDecomposition returns (rows, cols) from a shape by treating the last
// dimension as cols and collapsing all leading dimensions into rows.
func rowColDecomposition(s shapes.Shape) (rows, cols int) {
	if s.Rank() == 0 {
		return 1, 1
	}
	cols = s.Dimensions[s.Rank()-1]
	rows = s.Size() / cols
	if rows == 0 {
		rows = 1
	}
	return
}

// execSoftmaxHighway implements SIMD-accelerated softmax.
func execSoftmaxHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	axis := SoftmaxParams(node)
	input := inputs[0]
	output := FusedOpOutput(backend, node)
	shape := FusedOpOutputShape(node)

	switch input.DType() {
	case dtypes.Float32:
		softmaxHighway(input.Flat().([]float32), output.Flat().([]float32), axis, shape)
	case dtypes.Float64:
		softmaxHighway(input.Flat().([]float64), output.Flat().([]float64), axis, shape)
	default:
		return nil, errors.Errorf("highway Softmax: unsupported dtype %s", input.DType())
	}
	return output, nil
}

func softmaxHighway[T interface{ ~float32 | ~float64 }](input, output []T, axis int, shape shapes.Shape) {
	outerSize, axisSize, innerSize := computeAxisStrides(shape, axis)

	if innerSize == 1 {
		nn.ParallelSoftmax(hwyPool, input, output, outerSize, axisSize)
		return
	}

	blockSize := axisSize * innerSize
	tmp := make([]T, blockSize)

	for outer := 0; outer < outerSize; outer++ {
		off := outer * blockSize
		inBlock := input[off : off+blockSize]
		outBlock := output[off : off+blockSize]

		matmul.Transpose2D(inBlock, axisSize, innerSize, tmp)
		nn.ParallelSoftmax(hwyPool, tmp, tmp, innerSize, axisSize)
		matmul.Transpose2D(tmp, innerSize, axisSize, outBlock)
	}
}

// execGeluHighway implements SIMD-accelerated GELU.
func execGeluHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	input, output := UnaryOperandAndOutput(backend, inputs, inputsOwned)
	rows, cols := rowColDecomposition(input.Shape())

	switch input.DType() {
	case dtypes.Float32:
		activation.ParallelGELU(hwyPool, input.Flat().([]float32), output.Flat().([]float32), rows, cols)
	case dtypes.Float64:
		activation.ParallelGELU(hwyPool, input.Flat().([]float64), output.Flat().([]float64), rows, cols)
	default:
		return nil, errors.Errorf("highway Gelu: unsupported dtype %s", input.DType())
	}
	return output, nil
}

// execLayerNormHighway implements SIMD-accelerated layer normalization.
func execLayerNormHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	axes, epsilon := LayerNormParams(node)
	input := inputs[0]
	output := FusedOpOutput(backend, node)
	shape := input.Shape()

	var gamma, beta *Buffer
	if len(inputs) > 1 {
		gamma = inputs[1]
	}
	if len(inputs) > 2 {
		beta = inputs[2]
	}

	rank := len(shape.Dimensions)
	isTrailingAxes := true
	for i, a := range axes {
		if a != rank-len(axes)+i {
			isTrailingAxes = false
			break
		}
	}

	if !isTrailingAxes {
		switch input.DType() {
		case dtypes.Float32:
			LayerNormFloat32Fallback(input, output, gamma, beta, axes, epsilon)
		case dtypes.Float64:
			LayerNormFloat64Fallback(input, output, gamma, beta, axes, epsilon)
		default:
			return nil, errors.Errorf("highway LayerNorm: unsupported dtype %s", input.DType())
		}
		return output, nil
	}

	normSize := 1
	for _, a := range axes {
		normSize *= shape.Dimensions[a]
	}

	switch input.DType() {
	case dtypes.Float32:
		var gammaData, betaData []float32
		if gamma != nil {
			gammaData = gamma.Flat().([]float32)
		}
		if beta != nil {
			betaData = beta.Flat().([]float32)
		}
		nn.ParallelLayerNorm(hwyPool, input.Flat().([]float32), output.Flat().([]float32), normSize, gammaData, betaData, float32(epsilon))
	case dtypes.Float64:
		var gammaData, betaData []float64
		if gamma != nil {
			gammaData = gamma.Flat().([]float64)
		}
		if beta != nil {
			betaData = beta.Flat().([]float64)
		}
		nn.ParallelLayerNorm(hwyPool, input.Flat().([]float64), output.Flat().([]float64), normSize, gammaData, betaData, epsilon)
	default:
		return nil, errors.Errorf("highway LayerNorm: unsupported dtype %s", input.DType())
	}
	return output, nil
}

// execDenseActivationHighway implements SIMD-accelerated dense + activation: y = act(x @ W + b).
func execDenseActivationHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	x := inputs[1]
	weight := inputs[2]
	var bias *Buffer
	if len(inputs) > 3 {
		bias = inputs[3]
	}

	output := FusedOpOutput(backend, node)
	act := DenseParams(node)

	inFeatures := x.Shape().Dimensions[x.Shape().Rank()-1]
	outFeatures := weight.Shape().Dimensions[1]
	batchSize := x.Shape().Size() / inFeatures

	nnAct := nn.ActivationType(act)

	switch x.DType() {
	case dtypes.Float32:
		var biasData []float32
		if bias != nil {
			biasData = bias.Flat().([]float32)
		}
		wTransposed := make([]float32, inFeatures*outFeatures)
		matmul.Transpose2D(weight.Flat().([]float32), inFeatures, outFeatures, wTransposed)
		nn.DenseActivationAuto(hwyPool, x.Flat().([]float32), wTransposed, biasData, output.Flat().([]float32),
			batchSize, inFeatures, outFeatures, nnAct)
	case dtypes.Float64:
		var biasData []float64
		if bias != nil {
			biasData = bias.Flat().([]float64)
		}
		wTransposed := make([]float64, inFeatures*outFeatures)
		matmul.Transpose2D(weight.Flat().([]float64), inFeatures, outFeatures, wTransposed)
		nn.DenseActivationAuto(hwyPool, x.Flat().([]float64), wTransposed, biasData, output.Flat().([]float64),
			batchSize, inFeatures, outFeatures, nnAct)
	default:
		return nil, errors.Errorf("highway DenseActivation: unsupported dtype %s", x.DType())
	}
	return output, nil
}

// execQKVDenseHighway implements SIMD-accelerated fused QKV projection.
func execQKVDenseHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) ([]*Buffer, error) {
	x := inputs[0]
	wQKV := inputs[1]

	qDim, kvDim := QKVDenseParams(node)
	totalOut := qDim + 2*kvDim

	qBuf, kBuf, vBuf := QKVDenseOutputBuffers(backend, node)

	inFeatures := x.Shape().Dimensions[x.Shape().Rank()-1]
	batchSize := x.Shape().Size() / inFeatures

	var biasQ, biasK, biasV *Buffer
	biasIdx := 2
	if biasIdx < len(inputs) {
		biasQ = inputs[biasIdx]
		biasIdx++
	}
	if biasIdx < len(inputs) {
		biasK = inputs[biasIdx]
		biasIdx++
	}
	if biasIdx < len(inputs) {
		biasV = inputs[biasIdx]
	}

	switch x.DType() {
	case dtypes.Float32:
		wTransposed := make([]float32, inFeatures*totalOut)
		matmul.Transpose2D(wQKV.Flat().([]float32), inFeatures, totalOut, wTransposed)

		var bqData, bkData, bvData []float32
		if biasQ != nil {
			bqData = biasQ.Flat().([]float32)
		}
		if biasK != nil {
			bkData = biasK.Flat().([]float32)
		}
		if biasV != nil {
			bvData = biasV.Flat().([]float32)
		}
		nn.QKVDenseAuto(hwyPool,
			x.Flat().([]float32), wTransposed,
			bqData, bkData, bvData,
			qBuf.Flat().([]float32), kBuf.Flat().([]float32), vBuf.Flat().([]float32),
			batchSize, inFeatures, qDim, kvDim,
		)
	case dtypes.Float64:
		wTransposed := make([]float64, inFeatures*totalOut)
		matmul.Transpose2D(wQKV.Flat().([]float64), inFeatures, totalOut, wTransposed)

		var bqData, bkData, bvData []float64
		if biasQ != nil {
			bqData = biasQ.Flat().([]float64)
		}
		if biasK != nil {
			bkData = biasK.Flat().([]float64)
		}
		if biasV != nil {
			bvData = biasV.Flat().([]float64)
		}
		nn.QKVDenseAuto(hwyPool,
			x.Flat().([]float64), wTransposed,
			bqData, bkData, bvData,
			qBuf.Flat().([]float64), kBuf.Flat().([]float64), vBuf.Flat().([]float64),
			batchSize, inFeatures, qDim, kvDim,
		)
	default:
		return nil, errors.Errorf("highway QKVDense: unsupported dtype %s", x.DType())
	}
	return []*Buffer{qBuf, kBuf, vBuf}, nil
}

// execMultiHeadSDPAHighway implements SIMD-accelerated multi-head scaled dot-product attention.
func execMultiHeadSDPAHighway(backend *Backend, node *Node, inputs []*Buffer, inputsOwned []bool) (*Buffer, error) {
	numHeads, numKVHeads, scale, causal := MultiHeadSDPAParams(node)
	q := inputs[0]
	k := inputs[1]
	v := inputs[2]
	var mask *Buffer
	if len(inputs) > 3 {
		mask = inputs[3]
	}
	output := FusedOpOutput(backend, node)

	batchSize := q.Shape().Dimensions[0]
	seqLen := q.Shape().Dimensions[2]
	kvLen := k.Shape().Dimensions[2]
	headDim := q.Shape().Dimensions[3]

	var maskBatchStride, maskHeadStride int
	if mask != nil {
		maskBatchStride, maskHeadStride = computeMaskStrides(mask.Shape().Dimensions)
	}

	switch q.DType() {
	case dtypes.Float32:
		var maskData []float32
		if mask != nil {
			maskData = mask.Flat().([]float32)
		}
		nn.MultiHeadSDPAAuto(hwyPool,
			q.Flat().([]float32), k.Flat().([]float32), v.Flat().([]float32),
			maskData, output.Flat().([]float32),
			batchSize, numHeads, numKVHeads, seqLen, kvLen, headDim,
			maskBatchStride, maskHeadStride,
			float32(scale), causal,
		)
	case dtypes.Float64:
		var maskData []float64
		if mask != nil {
			maskData = mask.Flat().([]float64)
		}
		nn.MultiHeadSDPAAuto(hwyPool,
			q.Flat().([]float64), k.Flat().([]float64), v.Flat().([]float64),
			maskData, output.Flat().([]float64),
			batchSize, numHeads, numKVHeads, seqLen, kvLen, headDim,
			maskBatchStride, maskHeadStride,
			scale, causal,
		)
	default:
		return nil, errors.Errorf("highway MultiHeadSDPA: unsupported dtype %s", q.DType())
	}
	return output, nil
}
