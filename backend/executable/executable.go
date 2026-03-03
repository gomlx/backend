package executable

import (
	"github.com/sebffischer/backend/backend/array"
	"github.com/sebffischer/backend/backend/atype"
)

type Executable interface {
	// Finalize immediately frees resources associated to the executable.
	Finalize() error
	Inputs() []atype.ArrayType
	Outputs() []atype.ArrayType
	Execute(inputs []array.Array) (outputs []array.Array, err error)
}
