// Copyright 2023-2026 The GoMLX Authors. SPDX-License-Identifier: Apache-2.0

package simplego

import (
	"github.com/gomlx/gomlx/backends"
	"github.com/gomlx/gomlx/pkg/core/shapes"
)

// Exported helpers for subpackages (e.g. highway) to implement fused op executors.
// These extract the parameters from opaque node data and allocate output buffers,
// following the same pattern as UnaryOperandAndOutput.

// FusedOpOutput allocates an output buffer for a fused op based on the node's output shape.
func FusedOpOutput(backend *Backend, node *Node) *Buffer {
	return backend.getBufferForShape(node.shape)
}

// FusedOpOutputForShape allocates an output buffer for a given shape.
func FusedOpOutputForShape(backend *Backend, shape shapes.Shape) *Buffer {
	return backend.getBufferForShape(shape)
}

// FusedOpOutputShape returns the output shape for a fused op node.
func FusedOpOutputShape(node *Node) shapes.Shape {
	return node.shape
}

// MultiOutputShapes returns the output shapes for a multi-output node.
func MultiOutputShapes(node *Node) []shapes.Shape {
	return node.multiOutputsShapes
}

// SoftmaxParams extracts the axis from a Softmax node.
func SoftmaxParams(node *Node) (axis int) {
	return node.data.(*nodeFusedSoftmax).axis
}

// LayerNormParams extracts axes and epsilon from a LayerNorm node.
func LayerNormParams(node *Node) (axes []int, epsilon float64) {
	data := node.data.(*nodeFusedLayerNorm)
	return data.axes, data.epsilon
}

// DenseParams extracts the activation type from a FusedDense node.
func DenseParams(node *Node) backends.ActivationType {
	return node.data.(*nodeFusedDense).activation
}

// MultiHeadSDPAParams extracts the parameters from a MultiHeadSDPA node.
func MultiHeadSDPAParams(node *Node) (numHeads, numKVHeads int, scale float64, causal bool) {
	data := node.data.(*nodeFusedMultiHeadSDPA)
	return data.numHeads, data.numKVHeads, data.scale, data.causal
}

// QKVDenseParams extracts the parameters from a QKVDense node.
func QKVDenseParams(node *Node) (qDim, kvDim int) {
	data := node.data.(*nodeFusedQKVDense)
	return data.qDim, data.kvDim
}

// QKVDenseOutputBuffers allocates the three output buffers (q, k, v) for a QKVDense node.
func QKVDenseOutputBuffers(backend *Backend, node *Node) (q, k, v *Buffer) {
	outShapes := node.multiOutputsShapes
	return backend.getBufferForShape(outShapes[0]),
		backend.getBufferForShape(outShapes[1]),
		backend.getBufferForShape(outShapes[2])
}

// LayerNormFloat32Fallback is the scalar implementation of LayerNorm for float32.
// Used by the highway subpackage for non-trailing axis combinations where SIMD
// acceleration is not applicable.
func LayerNormFloat32Fallback(input, output, gamma, beta *Buffer, axes []int, epsilon float64) {
	layerNorm[float32](input, output, gamma, beta, axes, epsilon)
}

// LayerNormFloat64Fallback is the scalar implementation of LayerNorm for float64.
func LayerNormFloat64Fallback(input, output, gamma, beta *Buffer, axes []int, epsilon float64) {
	layerNorm[float64](input, output, gamma, beta, axes, epsilon)
}
