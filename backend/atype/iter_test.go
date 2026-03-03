package atype

import (
	"slices"
	"testing"

	"github.com/sebffischer/backend/backend/dtype"
	"github.com/stretchr/testify/require"
)

func TestArrayType_Strides(t *testing.T) {
	// Test case 1: array type with axis lengths [2, 3, 4]
	arrayType := Make(dtype.Float32, 2, 3, 4)
	strides := arrayType.Strides()
	require.Equal(t, []int{12, 4, 1}, strides)

	// Test case 2: array type with single axis
	arrayType = Make(dtype.Float32, 5)
	strides = arrayType.Strides()
	require.Equal(t, []int{1}, strides)

	// Test case 3: array type with axis lengths [3, 1, 2]
	arrayType = Make(dtype.Float32, 3, 1, 2)
	strides = arrayType.Strides()
	require.Equal(t, []int{2, 2, 1}, strides)
}

func TestArrayType_Iter(t *testing.T) {
	// Version 1: there is only one value to iterate:
	arrayType := Make(dtype.Float32, 1, 1, 1, 1)
	collect := make([][]int, 0, arrayType.NumElements())
	for flatIdx, indices := range arrayType.Iter() {
		collect = append(collect, slices.Clone(indices))
		require.Equal(t, 0, flatIdx) // There should only be one flatIdx, equal to 0.
	}
	require.Equal(t, [][]int{{0, 0, 0, 0}}, collect)

	// Version 2: all axes are "spatial" (length > 1)
	arrayType = Make(dtype.Float64, 3, 2)
	collect = make([][]int, 0, arrayType.NumElements())
	var counter int
	for flatIdx, indices := range arrayType.Iter() {
		collect = append(collect, slices.Clone(indices))
		require.Equal(t, counter, flatIdx)
		counter++
	}
	want := [][]int{
		{0, 0},
		{0, 1},
		{1, 0},
		{1, 1},
		{2, 0},
		{2, 1},
	}
	require.Equal(t, want, collect)

	// Version 3: with only 2 spatial axes.
	arrayType = Make(dtype.BFloat16, 3, 1, 2, 1)
	collect = make([][]int, 0, arrayType.NumElements())
	counter = 0
	for flatIdx, indices := range arrayType.Iter() {
		collect = append(collect, slices.Clone(indices))
		require.Equal(t, counter, flatIdx)
		counter++
	}
	want = [][]int{
		{0, 0, 0, 0},
		{0, 0, 1, 0},
		{1, 0, 0, 0},
		{1, 0, 1, 0},
		{2, 0, 0, 0},
		{2, 0, 1, 0},
	}
	require.Equal(t, want, collect)
}

func TestArrayType_IterOnAxes(t *testing.T) {
	// Array type with axis lengths [2, 3, 4]
	arrayType := Make(dtype.Float32, 2, 3, 4)

	// Test iteration on the first axis.
	var collect [][]int
	var flatIndices []int
	indices := make([]int, 3)
	indices[1] = 1               // Index 1 should be fixed to 1.
	axesToIterate := []int{0, 2} // We are only iterating on the axes 0 and 2.
	for flatIdx, indicesResult := range arrayType.IterOnAxes(axesToIterate, nil, indices) {
		collect = append(collect, slices.Clone(indicesResult))
		flatIndices = append(flatIndices, flatIdx)
	}
	require.Equal(t, [][]int{
		{0, 1, 0},
		{0, 1, 1},
		{0, 1, 2},
		{0, 1, 3},
		{1, 1, 0},
		{1, 1, 1},
		{1, 1, 2},
		{1, 1, 3},
	}, collect)
	require.Equal(t, []int{4, 5, 6, 7, 16, 17, 18, 19}, flatIndices)
}
