package atype

import (
	"iter"
	"slices"

	"github.com/pkg/errors"
)

// Strides returns the strides for each axis of the array type, assuming a "row-major" layout
// in memory, the one used everywhere in GoMLX.
//
// Notice the strides are **not in bytes**, but in indices.
func (at ArrayType) Strides() (strides []int) {
	numAxes := at.NumAxes()
	if numAxes == 0 {
		return
	}
	strides = make([]int, numAxes)
	if at.IsEmpty() {
		// Some axis has zero length.
		return
	}
	currentStride := 1
	for axis := numAxes - 1; axis >= 0; axis-- {
		strides[axis] = currentStride
		currentStride *= at.Axes[axis].Length
	}
	return
}

//TODO: All these methods could just be defined on HasArrayType instead of ArrayType.

// Iter iterates sequentially over all possible indices of axes of an array type.
//
// It yields the flat index (counter) and a slice of indices for each axis.
//
// To avoid allocating the slice of indices, the yielded indices is owned by the Iter() method:
// don't change it inside the loop.
func (at ArrayType) Iter() iter.Seq2[int, []int] {
	indices := make([]int, at.NumAxes())
	return at.IterOn(indices)
}

// IterOn iterates over all possible indices of axes of an array type.
//
// It yields the flat index (counter) and a slice of indices for each axis.
//
// The iteration updates the indices on the given indices slice.
// During the iteration the caller shouldn't modify the slice of indices, otherwise it will lead to undefined behavior.
//
// It expects len(indices) == at.NumAxes(). It will panic otherwise.
func (at ArrayType) IterOn(indices []int) iter.Seq2[int, []int] {
	if len(indices) != at.NumAxes() {
		panic(errors.Errorf("ArrayType.IterOn given len(indices) == %d, want it to be equal to the number of axes %d", len(indices), at.NumAxes()))
	}
	return func(yield func(int, []int) bool) {
		if !at.Ok() {
			return // Iteration completed (vacuously true as no items were yielded)
		}

		numAxes := at.NumAxes()
		if numAxes == 0 {
			// Valid scalar: yield one empty index slice.
			_ = yield(0, indices)
			return
		}

		// Defensive check: if any axis length is non-positive, treat as an empty iteration.
		// Make should prevent this for validly constructed array types.
		//
		// Also count the number of "non-trivial" axes: axes whose lengths > 1.
		numNonTrivialAxes := 0
		for _, axis := range at.Axes {
			if axis.Length <= 0 {
				return
			}
			if axis.Length > 1 {
				numNonTrivialAxes++
			}
		}

		// Version 1: there are only trivial axes, there is only one value to iterate over.
		for i := range indices {
			indices[i] = 0
		}
		if numNonTrivialAxes == 0 {
			yield(0, indices)
			return
		}

		// Version 2: most axes are non-trivial, simply iterate over all of them:
		if numAxes > numNonTrivialAxes+2 {
			// Loop until all indices are generated.
			// This structure simulates an N-dimensional counter for the indices.
			flatIdx := 0
		v2Yielder:
			for {
				if !yield(flatIdx, indices) {
					return // Consumer requested to stop iteration.
				}
				flatIdx++

				// Increment indices to the next set of coordinates
				// (row-major order: the last index changes fastest).
				for axis := numAxes - 1; axis >= 0; axis-- {
					if at.Axes[axis].Length == 1 {
						// Nothing to iterate at this axis.
						continue
					}
					indices[axis]++
					if indices[axis] < at.Axes[axis].Length {
						// Successfully incremented this axis; no carry-over needed.
						continue v2Yielder
					}
					// The current axis overflowed; reset it to 0 and
					// continue to increment the next higher-order axis (carry-over).
					indices[axis] = 0
				}

				// If the axis is less than 0, all axes have been iterated through
				// (i.e., the first axis also overflowed). Iteration is complete.
				break
			}
			return
		}

		// Version 3: many "trivial" axes (length == 1), create an indirection and only
		// iterate over the non-trivial axes:
		flatIdx := 0
		spatialAxes := make([]int, 0, numNonTrivialAxes)
		for axis, axisVal := range at.Axes {
			if axisVal.Length > 1 {
				spatialAxes = append(spatialAxes, axis)
			}
		}
		slices.Reverse(spatialAxes) // We want to iterate over the last axis first.
	v3Yielder:
		for {
			if !yield(flatIdx, indices) {
				return // Consumer requested to stop iteration.
			}
			flatIdx++

			// Increment indices to the next set of coordinates
			// (row-major order: the last index changes fastest).
			for _, axis := range spatialAxes {
				indices[axis]++
				if indices[axis] < at.Axes[axis].Length {
					// Successfully incremented this axis; no carry-over needed.
					continue v3Yielder
				}
				// The current axis overflowed; reset it to 0 and
				// continue to increment the next higher-order axis (carry-over).
				indices[axis] = 0
			}

			// That was the last index.
			break
		}
	}
}

// IterOnAxes iterates over all possible indices of the given array type's axesToIterate.
//
// It yields the flat index and the update indices for all axes of the array type (not only the one in axesToIterate).
// The indices not pointed by axesToIterate are not touched.
//
// Args:
//   - axesToIterate: axes of the array type to iterate over. They must be 0 <= axis < NumAxes.
//     Axes not included here are not touched in the indices.
//   - strides: for the array type, as returned by ArrayType.Strides(). If nil, it will use the value returned by ArrayType.Strides.
//     If you are iterating over an array type many times, pre-calculating the strides saves some time.
//     If provided, it expects len(strides) == at.NumAxes(). It will panic otherwise.
//   - indices: slice that will be yielded during the iteration, it must have length equal to the array type's number of axes.
//     If it is nil, one will be allocated for the iteration.
//     The indices not in axesToIterate are left untouched, but they are used to calculate the flatIdx that is also yielded.
//     If provided, it expects len(indices) == at.NumAxes(). It will panic otherwise.
//
// During the iteration the caller shouldn't modify the slice of indices, otherwise it will lead to undefined behavior.
//
// Example:
//
//	// Create an array type with dtype f32 and axis lengths [2, 3, 4]
//	arrayType := Make(dtypes.F32, 2, 3, 4)
//
//	// Iterate over the first and last axes (0 and 2)
//	axesToIterate := []int{0, 2}
//	indices := make([]int, arrayType.NumAxes())
//	indices[1] = 1  // Fix middle axis to 1
//
//	// Each iteration will update indices[0] and indices[2], keeping indices[1]=1
//	for flatIdx, indices := range arrayType.IterOnAxes(axesToIterate, nil, indices) {
//	    fmt.Printf("flatIdx=%d, indices=%v\n", flatIdx, indices)
//	}
func (at ArrayType) IterOnAxes(axesToIterate, strides, indices []int) iter.Seq2[int, []int] {
	numAxes := at.NumAxes()

	// Validate and initialize strides
	if strides == nil {
		strides = at.Strides()
	} else if len(strides) != numAxes {
		panic(errors.Errorf("ArrayType.IterOnAxes given len(strides) == %d, want it to be equal to the NumAxes %d", len(strides), numAxes))
	}

	// Validate and initialize indices
	if indices == nil {
		indices = make([]int, numAxes)
	} else if len(indices) != numAxes {
		panic(errors.Errorf("ArrayType.IterOnAxes given len(indices) == %d, want it to be equal to the NumAxes %d", len(indices), numAxes))
	}

	return func(yield func(int, []int) bool) {
		if !at.Ok() {
			return // Iteration completed (vacuously true as no items were yielded)
		}

		if numAxes == 0 {
			// Valid scalar: yield one empty index slice.
			_ = yield(0, indices)
			return
		}

		// Defensive check: if any axis length to iterate is non-positive, treat as an empty iteration.
		for _, axis := range axesToIterate {
			if axis < 0 || axis >= numAxes {
				panic(errors.Errorf("ArrayType.IterOnAxes: invalid axis %d, must be 0 <= axis < NumAxes (%d)", axis, numAxes))
			}
			if at.Axes[axis].Length <= 0 {
				return
			}
			// Initialize indices for the axesToIterate to 0.
			indices[axis] = 0
		}

		// Calculate initial flatIdx based on the current indices
		flatIdx := 0
		for axis := 0; axis < numAxes; axis++ {
			flatIdx += indices[axis] * strides[axis]
		}

	yielder:
		for {
			if !yield(flatIdx, indices) {
				return // Consumer requested to stop iteration.
			}

			// Increment indices to the next set of coordinates
			// (row-major order: the last axis changes fastest).
			for axisIdx := len(axesToIterate) - 1; axisIdx >= 0; axisIdx-- {
				axis := axesToIterate[axisIdx]
				indices[axis]++
				flatIdx += strides[axis]
				if indices[axis] < at.Axes[axis].Length {
					// Successfully incremented this axis; no carry-over needed.
					continue yielder
				}
				// The current axis overflowed; reset it to 0 and
				// continue to increment the next higher-order axis (carry-over).
				flatIdx -= indices[axis] * strides[axis]
				indices[axis] = 0
			}

			// That was the last index.
			break
		}
	}
}
