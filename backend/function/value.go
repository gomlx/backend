package function

import "github.com/sebffischer/backend/backend/atype"

// TODO: stablehlo defines ValueType as TokenType | TensorType
// -> Do we want to support tokens?
type Value struct {
	// TODO: dynamic axes?
	Type atype.ArrayType
	// Annotation can store arbitrary backend-dependent information, e.g., sharding information.
	Annotation map[string]any
}

func (v Value) NumAxes() int {
	return v.Type.NumAxes()
}

func (v Value) AxisLength(axis int) int {
	return v.Type.AxisLength(axis)
}
