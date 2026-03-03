/*
 *	Copyright 2023 Jan Pfeifer
 *
 *	Licensed under the Apache License, Version 2.0 (the "License");
 *	you may not use this file except in compliance with the License.
 *	You may obtain a copy of the License at
 *
 *	http://www.apache.org/licenses/LICENSE-2.0
 *
 *	Unless required by applicable law or agreed to in writing, software
 *	distributed under the License is distributed on an "AS IS" BASIS,
 *	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *	See the License for the specific language governing permissions and
 *	limitations under the License.
 */

package atype

import (
	"testing"

	"github.com/sebffischer/backend/backend/dtype"
	"github.com/stretchr/testify/require"
)

func TestCastAsDType(t *testing.T) {
	value := [][]int{{1, 2}, {3, 4}, {5, 6}}
	{
		want := [][]float32{{1, 2}, {3, 4}, {5, 6}}
		got := CastAsDType(value, dtype.Float32)
		require.Equal(t, want, got)
	}
	{
		want := [][]complex64{{1, 2}, {3, 4}, {5, 6}}
		got := CastAsDType(value, dtype.Complex64)
		require.Equal(t, want, got)
	}
}

func TestArrayType(t *testing.T) {
	invalidArrayType := Invalid()
	require.False(t, invalidArrayType.Ok())

	arrayType0 := Make(dtype.Float64)
	require.True(t, arrayType0.Ok())
	require.True(t, arrayType0.IsScalar())
	require.Equal(t, 0, arrayType0.NumAxes())
	require.Len(t, arrayType0.Axes, 0)
	require.Equal(t, 1, arrayType0.NumElements())
	require.Equal(t, 8, int(arrayType0.Memory()))

	arrayType1 := Make(dtype.Float32, 4, 3, 2)
	require.True(t, arrayType1.Ok())
	require.False(t, arrayType1.IsScalar())
	require.Equal(t, 3, arrayType1.NumAxes())
	require.Len(t, arrayType1.Axes, 3)
	require.Equal(t, 4*3*2, arrayType1.NumElements())
	require.Equal(t, 4*4*3*2, int(arrayType1.Memory()))
}

func TestAxisLength(t *testing.T) {
	arrayType := Make(dtype.Float32, 4, 3, 2)
	require.Equal(t, 4, arrayType.AxisLength(0))
	require.Equal(t, 3, arrayType.AxisLength(1))
	require.Equal(t, 2, arrayType.AxisLength(2))
	require.Equal(t, 4, arrayType.AxisLength(-3))
	require.Equal(t, 3, arrayType.AxisLength(-2))
	require.Equal(t, 2, arrayType.AxisLength(-1))
	require.Panics(t, func() { _ = arrayType.AxisLength(3) })
	require.Panics(t, func() { _ = arrayType.AxisLength(-4) })
}

func TestFromAnyValue(t *testing.T) {
	arrayType, err := FromAnyValue([]int32{1, 2, 3})
	require.NoError(t, err)
	require.NotPanics(t, func() { arrayType.AssertAxisLengths(3) })

	arrayType, err = FromAnyValue([][][]complex64{{{1, 2, -3}, {3, 4 + 2i, -7 - 1i}}})
	require.NoError(t, err)
	require.NotPanics(t, func() { arrayType.AssertAxisLengths(1, 2, 3) })

	// Irregular array type is not accepted:
	arrayType, err = FromAnyValue([][]float32{{1, 2, 3}, {4, 5}})
	require.Errorf(t, err, "irregular array type should have returned an error, instead got array type %s", arrayType)
}
