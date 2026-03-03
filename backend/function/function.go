package function

type Function interface {
	// TODO: Do we need named inputs?
	// Registers a new input value for the function.
	// The output value can be the same as the input value, but this is not required.
	// For example, for XLA, the input annotation might include information about buffer donation
	// or sharding information.
	NewInput(value Value) Value
	// Finalizes the functions by specifying the output values.
	// Afterwards, `IsFinalized` should return true.
	Finalize(values ...Value)
	// Whether the function has already been finalized.
	IsFinalized() bool
}
