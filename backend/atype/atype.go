// Package atype defines ArrayType and associated tools.
//
// ArrayType represents the array type (dtype and axes) of either an Array or the expected
// array type of a node in a computation Graph. DType indicates the data type for an Array's unit element.
//
// ArrayType and DType are used both by the concrete array values (see pkg/core/arrays package) and when
// working on the symbolic computation graph (see pkg/core/graph package).
//
// Go float16 support (commonly used by Nvidia GPUs) uses github.com/x448/float16 implementation,
// and bfloat16 uses a simple implementation in github.com/gomlx/gopjrt/dtypes/bfloat16.
//
// ## Glossary
//
//   - NumAxes: number of axes of an Array.
//   - Axis: is the axis of an Array (plural: axes).
//   - AxisLength: the length of an axis in an Array. See the example below.
//     The length of an axis can also be 0.
//   - DType: the data type of the unit element in an array. See the dtype package for possible values.
//   - Scalar: Refers to an Array with 0 axes.
//
// Example: The multi-dimensional array `[][]int32{{0, 1, 2}, {3, 4, 5}}` if converted to an Array
// would have array type `(int32)[2 3]`. We say it has 2 axes (num_axes=2), axis 0 has
// length 2, and axis 1 has length 3. This array type could be created with
// `atype.Make(int32, 2, 3)`.
//
// ## Asserts
//
// When coding ML models, one delicate part is keeping tabs on the array type of
// graph nodes -- unfortunately, there is no compile-time checking of values,
// so validation only happens in runtime. To facilitate and also to serve as code documentation,
// this package provides two variations of _assert_ functionality. Examples:
//
// AssertNumAxes and AssertAxisLengths check that the number of axes and axis lengths of the given
// object (that has an `ArrayType` method) match, otherwise it panics. The `-1` means
// the axis length is unchecked (it can be anything).
//
//	func modelGraph(ctx *context.Context, spec any, inputs []*Node) ([]*Node) {
//		_ = spec  // Not needed here, we know the dataset.
//		atype.AssertNumAxes(inputs, 2)
//		batchSize := inputs.ArrayType().Axes[0].Length
//		logits := layers.Dense(ctx, inputs[0], /* useBias= */ true, /* outputDim= */ 1)
//		atype.AssertAxisLengths(logits, batchSize, -1)
//		return []*Node{logits}
//	}
//
// ```
//
// If you don't want to panic, but instead return an error through the `graph.Graph`, you can
// use the `Node.AssertAxisLengths()` method. So it would look like `logits.AssertAxisLengths(batchSize, -1)`.
package atype

import (
	"encoding/gob"
	"fmt"
	"reflect"
	"slices"

	"github.com/pkg/errors"
	"github.com/sebffischer/backend/backend/dtype"
)

// Axis represents a single axis of an array, which has a length.
type Axis struct {
	Length int
}

// Axes is a vector containing zero or more Axis.
// Each axis has a length, which is the number of elements along that axis.
type Axes []Axis

// Lengths returns a slice of the lengths of each axis.
// This is a convenience method for when you need axis lengths as []int.
func (axes Axes) Lengths() []int {
	lengths := make([]int, len(axes))
	for i, axis := range axes {
		lengths[i] = axis.Length
	}
	return lengths
}

// ArrayType represents the array type (dtype and axes) of either an Array or from some computation node
// that wraps an Array (e.g., when building a Graph).
//
// Use Make to create a new array type. See examples in the package documentation.
type ArrayType struct {
	// DType is the data type of the unit element in a tensor.
	DType dtype.DType

	// Axes holds the axes of the array.
	Axes Axes
}

// Make returns an ArrayType structure filled with the values given.
func Make(dtype dtype.DType, axisLengths ...int) ArrayType {
	axes := make(Axes, len(axisLengths))
	for i, length := range axisLengths {
		if length < 0 {
			panic(errors.Errorf("atype.Make: cannot create an array type with an axis with length < 0 (axis %d has length %d)", i, length))
		}
		axes[i] = Axis{Length: length}
	}
	return ArrayType{Axes: axes, DType: dtype}
}

// Scalar returns a scalar ArrayType for the given type.
func Scalar[T dtype.Number]() ArrayType {
	return ArrayType{DType: dtype.FromGenericsType[T]()}
}

// Invalid returns an invalid array type.
//
// Invalid().Ok() == false.
func Invalid() ArrayType {
	return ArrayType{DType: dtype.InvalidDType}
}

// Ok returns whether this is a valid ArrayType. A "zero" array type, that is just instantiating it with ArrayType{} will be invalid.
func (at ArrayType) Ok() bool { return at.DType != dtype.InvalidDType }

// NumAxes returns the number of axes of the array.
func (at ArrayType) NumAxes() int { return len(at.Axes) }

// IsScalar returns whether the array type represents a scalar, that is there are no axes.
func (at ArrayType) IsScalar() bool { return at.Ok() && at.NumAxes() == 0 }

// AxisLength returns the length of the given axis. axis can take negative numbers, in which
// case it counts as starting from the end -- so axis=-1 refers to the last axis.
// Like with a slice indexing, it panics for an out-of-bound axis.
func (at ArrayType) AxisLength(axis int) int {
	adjustedAxis := axis
	if adjustedAxis < 0 {
		adjustedAxis += at.NumAxes()
	}
	if adjustedAxis < 0 || adjustedAxis >= at.NumAxes() {
		panic(errors.Errorf("ArrayType.AxisLength(%d) out-of-bounds for NumAxes %d (arrayType=%s)", axis, at.NumAxes(), at))
	}
	return at.Axes[adjustedAxis].Length
}

func (at ArrayType) ArrayType() ArrayType { return at }

// String implements stringer, pretty-prints the array type.
func (at ArrayType) String() string {
	if at.NumAxes() == 0 {
		return fmt.Sprintf("(%s)", at.DType)
	}
	return fmt.Sprintf("(%s)%v", at.DType, at.Axes.Lengths())
}

// NumElements returns the number of elements (not bytes) for this array type. It's the product of all axis lengths.
//
// For the number of bytes used to store an array with this array type, see ArrayType.Memory.
// TODO: Rename to numElemenets
func (at ArrayType) NumElements() (numElements int) {
	numElements = 1
	for _, axis := range at.Axes {
		numElements *= axis.Length
	}
	return
}

// IsEmpty returns whether any of the axis lengths is zero, in which case
// it's an empty array type, with no data attached to it.
//
// Notice scalars are not zero in size -- they have size one, but zero axes.
// TODO: Rename to HasZeroElements()
func (at ArrayType) IsEmpty() bool {
	for _, axis := range at.Axes {
		if axis.Length == 0 {
			return true
		}
	}
	return false

}

// Memory returns the memory used to store an array of the given array type, the same as the size in bytes.
// Careful, so far all types in Go and on device seem to use the same sizes, but future type this is not guaranteed.
func (at ArrayType) Memory() uintptr {
	// FIXME: How to handle sub-byte types (like S2 etc.)
	return at.DType.Memory() * uintptr(at.NumElements())
}

// Equal compares two array types for equality: dtype and axis lengths are compared.
func (at ArrayType) Equal(other ArrayType) bool {
	if at.DType != other.DType {
		return false
	}
	return at.EqualAxes(other)
}

// EqualAxes compares two array types for equality of axes. Dtypes can be different.
func (at ArrayType) EqualAxes(other ArrayType) bool {
	if at.NumAxes() != other.NumAxes() {
		return false
	}
	if at.IsScalar() {
		return true
	}
	// For normal array types just compare axes.
	return slices.EqualFunc(at.Axes, other.Axes, func(a, b Axis) bool {
		return a.Length == b.Length
	})
}

// Clone returns a new deep copy of the array type.
func (at ArrayType) Clone() (cloned ArrayType) {
	cloned.DType = at.DType
	cloned.Axes = slices.Clone(at.Axes)
	return
}

// GobSerialize serializes the array type in binary format.
func (at ArrayType) GobSerialize(encoder *gob.Encoder) (err error) {
	enc := func(e any) {
		if err != nil {
			return
		}
		err = encoder.Encode(e)
		if err != nil {
			err = errors.Wrapf(err, "failed to serialize ArrayType %s", at)
		}
	}
	enc(at.DType)
	enc(at.Axes)
	return
}

// GobDeserialize deserializes an ArrayType. Returns new ArrayType or an error.
func GobDeserialize(decoder *gob.Decoder) (at ArrayType, err error) {
	dec := func(data any) {
		if err != nil {
			return
		}
		err = decoder.Decode(data)
		if err != nil {
			err = errors.Wrapf(err, "failed to deserialize ArrayType")
		}
	}
	dec(&at.DType)
	dec(&at.Axes)
	return
}

// ConcatenateAxes of two array types. The resulting number of axes is the sum of both numbers of axes. They must
// have the same dtype. If any of them is a scalar, the resulting array type will be a copy of the other.
// TODO: Not sure how much I like this name
func ConcatenateAxes(at1, at2 ArrayType) (result ArrayType) {
	if at1.DType == dtype.InvalidDType || at2.DType == dtype.InvalidDType {
		return
	}
	if at1.DType != at2.DType {
		return
	}
	if at1.IsScalar() {
		return at2.Clone()
	} else if at2.IsScalar() {
		return at1.Clone()
	}
	result.DType = at1.DType
	result.Axes = make(Axes, at1.NumAxes()+at2.NumAxes())
	copy(result.Axes, at1.Axes)
	copy(result.Axes[at1.NumAxes():], at2.Axes)
	return
}

// FromAnyValue attempts to convert a Go "any" value to its expected array type.
// Accepted values are plain-old-data (POD) types (ints, floats, complex), slices (or multiple level of slices) of POD.
//
// It returns the expected array type.
//
// Example:
//
//	arrayType := atype.FromAnyValue([][]float64{{0, 0}}) // Returns array type (Float64)[1 2]
func FromAnyValue(v any) (arrayType ArrayType, err error) {
	err = arrayTypeForAnyValueRecursive(&arrayType, reflect.ValueOf(v), reflect.TypeOf(v))
	return
}

func arrayTypeForAnyValueRecursive(arrayType *ArrayType, v reflect.Value, t reflect.Type) error {
	if t.Kind() != reflect.Slice {
		// If it's not a slice, it must be one of the supported scalar types.
		arrayType.DType = dtype.FromGoType(t)
		if arrayType.DType == dtype.InvalidDType {
			return errors.Errorf("cannot convert type %q to a valid backend array type (maybe type not supported yet?)", t)
		}
		return nil
	}

	// Slice: recurse into its element type (again slices or a supported POD).
	t = t.Elem()
	arrayType.Axes = append(arrayType.Axes, Axis{Length: v.Len()})
	arrayTypePrefix := arrayType.Clone()

	// The first element is the reference
	if v.Len() == 0 {
		return errors.Errorf("value with empty slice not valid for array type conversion: %T: %v -- it wouldn't be possible to figure out the inner axis lengths", v.Interface(), v)
	}
	v0 := v.Index(0)
	err := arrayTypeForAnyValueRecursive(arrayType, v0, t)
	if err != nil {
		return err
	}

	// Test that other elements have the same array type as the first one.
	for ii := 1; ii < v.Len(); ii++ {
		arrayTypeTest := arrayTypePrefix.Clone()
		err = arrayTypeForAnyValueRecursive(&arrayTypeTest, v.Index(ii), t)
		if err != nil {
			return err
		}
		if !arrayType.Equal(arrayTypeTest) {
			return fmt.Errorf("sub-slices have irregular array types, found array types %q, and %q", arrayType, arrayTypeTest)
		}
	}
	return nil
}
