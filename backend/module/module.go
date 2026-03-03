package module

import (
	"github.com/sebffischer/backend/backend/executable"
	"github.com/sebffischer/backend/backend/function"
)

type Module interface {
	// Create a new function in the module.
	// Returns an error if the function already exists or the name is invalid.
	NewFunction(name string, opts map[string]any) (function.Function, error)
	// Compile compiles the function with the given name into an executable.
	// Returns an error if the function does not exist or is not finalized.
	Compile(name string, opts map[string]any) (executable.Executable, error)
}
