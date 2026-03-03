package array

import (
	"github.com/sebffischer/backend/backend/atype"
)

// Axes is an alias for atype.Axes (a vector of Axis).
//
// Glossary: We use "axes" (plural of axis) instead of "shape" or "dimensions".
// The length of Axes is the number of axes (num_axes).
type Axes = atype.Axes

// Array represents an array value, potentially placed (sharded/replicated) across devices.
type Array interface {
	// Finalize allows the client to inform backend that array is no longer needed and associated resources can be
	// freed immediately -- as opposed to waiting for a GC.
	// An error is returned if the array is already finalized.
	//
	// A finalized array should never be used again.
	Finalize() error
	// ArrayType returns the type of the array, which includes the dtype and the axes.
	// If the array is finalized, an error is returned.
	ArrayType() (atype.ArrayType, error)
	// Placement returns the placement of the array, i.e., how it is distributed across devices.
	// Such a placement is a mapping from devices to (possiblu empty or overlapping) shards.
	// Returns an error if the array is finalized.
	Placement() (Placement, error)
	// Writes the content of the array to a flat array.
	// Returns an error if the array is finalized or the array has the wrong size and nil otherwise.
	Write(to any) error
	// Returns the underlying data if the array is a shared array.
	// Returns an error otherwise.
	Data() (flat any, err error)
	// Copies the array to the given placement.
	// Returns an error if the placement is the same as the current placement.
	Relocate(to Placement) (relocated Array, err error)
}
