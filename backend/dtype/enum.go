package dtype

// DType
// The data type of values in an `Array`.
// TODO: Rename to DatType (but used in too many places, so wait until everything is ported)
type DType int32

// The types are those listed in: https://openxla.org/stablehlo/spec#types (excluding a few like tf32)
// TODO: Make the constant names for data types more go idiomatic once we have ported all existing relevant code from gopjrt and gomlc
// (so we can just rename the symbols globally)
const (
	// InvalidDType is used to represent an invalid data type.
	InvalidDType DType = 0

	// Bool is used to represent a boolean value.
	Bool DType = 1

	// Int8 is used to represent an 8-bit signed integer.
	Int8 DType = 2

	// Int16 is used to represent a 16-bit signed integer.
	Int16 DType = 3

	// Int32 is used to represent a 32-bit signed integer.
	Int32 DType = 4

	// Int64 is used to represent a 64-bit signed integer.
	Int64 DType = 5

	// Uint8 is used to represent an 8-bit unsigned integer.
	Uint8 DType = 6

	// Uint16 is used to represent a 16-bit unsigned integer.
	Uint16 DType = 7

	// Uint32 is used to represent a 32-bit unsigned integer.
	Uint32 DType = 8

	// Uint64 is used to represent a 64-bit unsigned integer.
	Uint64 DType = 9

	// Float16 is used to represent a 16-bit floating-point number.
	Float16 DType = 10

	// Float32 is used to represent a 32-bit floating-point number.
	Float32 DType = 11

	// Float64 is used to represent a 64-bit floating-point number.
	Float64 DType = 12

	// Truncated 16 bit floating-point format. This is similar to IEEE's 16 bit
	// floating-point format, but uses 1 bit for the sign, 8 bits for the exponent
	// and 7 bits for the mantissa.
	BFloat16 DType = 13

	// Complex64 is used to represent a 64-bit complex number.
	Complex64 DType = 14

	// Complex128 is a 1:1 mapping of the corresponding C enum value defined in pjrt_c_api.h (as PJRT_Buffer_Type_C128).
	// Paired F64 (real, imag), as in std::complex<double>.
	Complex128 DType = 15

	// Corresponds to E5M2 from [FP8 Formats for Deep Learning](https://arxiv.org/pdf/2209.05433).
	F8E5M2 DType = 16

	// Corresponds to E4M3 from [FP8 Formats for Deep Learning](https://arxiv.org/pdf/2209.05433).
	F8E4M3FN DType = 17

	// Corresponds to E4M3 from [Hybrid 8-bit Floating Point (HFP8) Training and Inference for Deep Neural Networks](https://proceedings.neurips.cc/paper_files/paper/2019/file/65fc9fb4897a89789352e211ca2d398f-Paper.pdf).
	F8E4M3B11FNUZ DType = 18

	// Corresponds to E5M2 from [8-bit Numerical Formats for Deep Neural Networks](https://arxiv.org/abs/2206.02915).
	F8E5M2FNUZ DType = 19

	// Corresponds to E4M3 from [8-bit Numerical Formats for Deep Neural Networks](https://arxiv.org/abs/2206.02915).
	F8E4M3FNUZ DType = 20

	// S4 is a 4-bit signed integer.
	S4 DType = 21

	// U4 is a 4-bit unsigned integer.
	U4 DType = 22

	// Signed 2-bit integer.
	S2 DType = 23

	// Unsigned 2-bit integer.
	U2 DType = 24

	// 8-bit floating point with 4 exponent bits and 3 mantissa bits following IEEE-754 conventions.
	F8E4M3 DType = 25

	// 8-bit floating point with 3 exponent bits and 4 mantissa bits following IEEE-754 conventions.
	F8E3M4 DType = 26

	// Type descriced in [OCP Microscaling Formats Specification](https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf)
	F8E8M0FNU DType = 27

	// Type descriced in [OCP Microscaling Formats Specification](https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf)
	F4E2M1FN DType = 28

	// Type descriced in [OCP Microscaling Formats Specification](https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf)
	F6E3M2FN DType = 29

	// Type descriced in [OCP Microscaling Formats Specification](https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf)
	F6E2M3FN DType = 30
)

// MapOfNames to their dtypes. It includes also aliases to the various dtypes.
// It is also later initialized to include the lower-case version of the names.
var MapOfNames = map[string]DType{
	"InvalidDType":  InvalidDType,
	"INVALID":       InvalidDType,
	"Bool":          Bool,
	"PRED":          Bool,
	"Int8":          Int8,
	"S8":            Int8,
	"Int16":         Int16,
	"S16":           Int16,
	"Int32":         Int32,
	"S32":           Int32,
	"Int64":         Int64,
	"S64":           Int64,
	"Uint8":         Uint8,
	"U8":            Uint8,
	"Uint16":        Uint16,
	"U16":           Uint16,
	"Uint32":        Uint32,
	"U32":           Uint32,
	"Uint64":        Uint64,
	"U64":           Uint64,
	"Float16":       Float16,
	"F16":           Float16,
	"Float32":       Float32,
	"F32":           Float32,
	"Float64":       Float64,
	"F64":           Float64,
	"BFloat16":      BFloat16,
	"BF16":          BFloat16,
	"Complex64":     Complex64,
	"C64":           Complex64,
	"Complex128":    Complex128,
	"C128":          Complex128,
	"F8E5M2":        F8E5M2,
	"F8E4M3FN":      F8E4M3FN,
	"F8E4M3B11FNUZ": F8E4M3B11FNUZ,
	"F8E5M2FNUZ":    F8E5M2FNUZ,
	"F8E4M3FNUZ":    F8E4M3FNUZ,
	"S4":            S4,
	"U4":            U4,
	"S2":            S2,
	"U2":            U2,
	"F8E4M3":        F8E4M3,
	"F8E3M4":        F8E3M4,
	"F8E8M0FNU":     F8E8M0FNU,
	"F4E2M1FN":      F4E2M1FN,
	"F6E3M2FN":      F6E3M2FN,
	"F6E2M3FN":      F6E2M3FN,
}
