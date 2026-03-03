package atype

// TODO(remove?): This should probably live in dtype, but I will postpone that until most of
// gopjrt/gomlx is ported

import (
	"reflect"
	"unsafe"

	"github.com/pkg/errors"
	"github.com/sebffischer/backend/backend/dtype"
	"github.com/sebffischer/backend/backend/dtype/bfloat16"
	"github.com/x448/float16"
)

// ConvertTo converts any scalar (typically returned by `tensor.Local.Value()`) of the
// supported dtypes to `T`.
// Returns 0 if value is not a scalar or not a supported number (e.g: bool).
// It doesn't work for if T (the output type) is a complex number.
// If value is a complex number, it converts by taking the real part of the number and
// discarding the imaginary part.
func ConvertTo[T dtype.NumberNotComplex](value any) T {
	t, ok := value.(T)
	if ok {
		return t
	}
	if reflect.TypeOf(t) == float16Type {
		v32 := ConvertTo[float32](value)
		return T(float16.Fromfloat32(v32))
	}

	switch v := value.(type) {
	case float64:
		return T(v)
	case float32:
		return T(v)
	case float16.Float16:
		return T(v.Float32())
	case bfloat16.BFloat16:
		return T(v.Float32())
	case int:
		return T(v)
	case int64:
		return T(v)
	case int32:
		return T(v)
	case int16:
		return T(v)
	case int8:
		return T(v)
	case uint64:
		return T(v)
	case uint32:
		return T(v)
	case uint16:
		return T(v)
	case uint8:
		return T(v)
	case complex64:
		return T(real(v))
	case complex128:
		return T(real(v))
	}
	return T(0)
}

// UnsafeSliceForDType creates a slice of the corresponding dtype
// and casts it to any.
// It uses unsafe.Slice.
// Set `len` to the number of `DType` elements (not the number of bytes).
// TODO: This should return (any, error), but first wait whether we need it in the abstract backend.
func UnsafeSliceForDType(dt dtype.DType, unsafePtr unsafe.Pointer, len int) (any, error) {
	var val any
	switch dt {
	case dtype.Int64:
		val = unsafe.Slice((*int64)(unsafePtr), len)
	case dtype.Int32:
		val = unsafe.Slice((*int32)(unsafePtr), len)
	case dtype.Int16:
		val = unsafe.Slice((*int16)(unsafePtr), len)
	case dtype.Int8:
		val = unsafe.Slice((*int8)(unsafePtr), len)

	case dtype.Uint64:
		val = unsafe.Slice((*uint64)(unsafePtr), len)
	case dtype.Uint32:
		val = unsafe.Slice((*uint32)(unsafePtr), len)
	case dtype.Uint16:
		val = unsafe.Slice((*uint16)(unsafePtr), len)
	case dtype.Uint8:
		val = unsafe.Slice((*uint8)(unsafePtr), len)

	case dtype.Bool:
		val = unsafe.Slice((*bool)(unsafePtr), len)

	case dtype.Float16:
		val = unsafe.Slice((*float16.Float16)(unsafePtr), len)
	case dtype.BFloat16:
		val = unsafe.Slice((*bfloat16.BFloat16)(unsafePtr), len)
	case dtype.Float32:
		val = unsafe.Slice((*float32)(unsafePtr), len)
	case dtype.Float64:
		val = unsafe.Slice((*float64)(unsafePtr), len)

	case dtype.Complex64:
		val = unsafe.Slice((*complex64)(unsafePtr), len)
	case dtype.Complex128:
		val = unsafe.Slice((*complex128)(unsafePtr), len)
	default:
		return nil, errors.Errorf("unknown dtype %q (%d) in UnsafeSliceForDType", dt, dt)
	}

	return val, nil
}

// Pre-generate constant reflect.TypeOf for convenience.
var (
	float32Type  = reflect.TypeOf(float32(0))
	float64Type  = reflect.TypeOf(float64(0))
	float16Type  = reflect.TypeOf(float16.Float16(0))
	bfloat16Type = reflect.TypeOf(bfloat16.BFloat16(0))
)

var _ = bfloat16Type // intentional: shut up the linter

// CastAsDType casts a numeric value to the corresponding for the DType.
// If the value is a slice it will convert to a newly allocated slice of
// the given DType.
//
// It doesn't work for complex numbers.
func CastAsDType(value any, dt dtype.DType) any {
	typeOf := reflect.TypeOf(value)
	valueOf := reflect.ValueOf(value)
	newTypeOf := typeForSliceDType(typeOf, dt)
	if typeOf.Kind() != reflect.Slice && typeOf.Kind() != reflect.Array {
		// Scalar value.
		if dt == dtype.Bool {
			return !valueOf.IsZero()
		}
		if dt == dtype.Complex64 {
			r := valueOf.Convert(float32Type).Interface().(float32)
			return complex(r, float32(0))
		}
		if dt == dtype.Complex128 {
			r := valueOf.Convert(float64Type).Interface().(float64)
			return complex(r, float64(0))
		}
		if dt == dtype.Float16 {
			v32 := valueOf.Convert(float32Type).Interface().(float32)
			return float16.Fromfloat32(v32)
		}
		if dt == dtype.BFloat16 {
			v32 := valueOf.Convert(float32Type).Interface().(float32)
			return bfloat16.FromFloat32(v32)
		}
		// TODO: if adding support for non-native Go types (e.g: BFloat16), we need
		//       to write our own conversion here.
		return valueOf.Convert(newTypeOf).Interface()
	}

	newValueOf := reflect.MakeSlice(newTypeOf, valueOf.Len(), valueOf.Len())
	for ii := 0; ii < valueOf.Len(); ii++ {
		elem := CastAsDType(valueOf.Index(ii).Interface(), dt)
		newValueOf.Index(ii).Set(reflect.ValueOf(elem))
	}
	return newValueOf.Interface()
}

// typeForSliceDType recursively converts a type that is a (multi-dimension-) slice
// of some type, to the same (multi-dimension-) slice of a reflect.Type corresponding to
// the dtype.
//
// Arrays are converted to slices.
func typeForSliceDType(valueType reflect.Type, dt dtype.DType) reflect.Type {
	if valueType.Kind() != reflect.Slice && valueType.Kind() != reflect.Array {
		// Base case for recursion, simply return the `reflect.Type` for the DType.
		return dt.GoType()
	}
	subType := typeForSliceDType(valueType.Elem(), dt)
	return reflect.SliceOf(subType) // Return a slice of the recursively converted type.
}
