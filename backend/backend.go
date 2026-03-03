package backend

import (
	"github.com/sebffischer/backend/backend/array"
	"github.com/sebffischer/backend/backend/atype"
	"github.com/sebffischer/backend/backend/module"
)

type Backend interface {
	// Create a new array on the given device.
	NewArray(data any, arrayType atype.ArrayType, placement array.Placement) (array.Array, error)
	// Create a array that shares memory with the host.
	// This is only possible when using CPU as the device.
	NewSharedArray(data any, arrayType atype.ArrayType, placement array.Placement) (array.Array, error)
	// Create a new module.
	NewModule() module.Module
}
