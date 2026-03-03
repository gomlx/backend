package atype

import (
	"fmt"

	"github.com/pkg/errors"
	"github.com/sebffischer/backend/backend/dtype"
)

// UncheckedAxis can be used in CheckAxisLengths or AssertAxisLengths functions for an axis
// whose length doesn't matter.
// TODO: Probably remove this once we have proper mechanism for dynamic axes.
const UncheckedAxis = int(-1)

// HasArrayType is an interface for objects that have an associated ArrayType.
// TODO(rename): Rename to HasArrayType / ArrayLike
type HasArrayType interface {
	ArrayType() ArrayType
}

// CheckAxisLengths checks that the array type has the given axis lengths and number of axes. A value of -1 in
// axisLengths means it can take any value and is not checked.
//
// It returns an error if the number of axes is different or if any of the axis lengths don't match.
func (at ArrayType) CheckAxisLengths(axisLengths ...int) error {
	if at.NumAxes() != len(axisLengths) {
		return errors.Errorf("array type (%s) has incompatible number of axes %d (wanted %d)", at, at.NumAxes(), len(axisLengths))
	}
	for ii, wantLength := range axisLengths {
		if wantLength != -1 && at.Axes[ii].Length != wantLength {
			return errors.Errorf("array type (%s) axis %d has length %d, wanted %d (wanted=%v)", at, ii, at.Axes[ii].Length, wantLength, axisLengths)
		}
	}
	return nil
}

// Check that the array type has the given dtype, axis lengths and number of axes. A value of -1 in
// axisLengths means it can take any value and is not checked.
//
// It returns an error if the dtype or number of axes is different or if any of the axis lengths don't match.
func (at ArrayType) Check(dtype dtype.DType, axisLengths ...int) error {
	if dtype != at.DType {
		return errors.Errorf("array type (%s) has incompatible dtype %s (wanted %s)", at, at.DType, dtype)
	}
	return at.CheckAxisLengths(axisLengths...)
}

// AssertAxisLengths checks that the array type has the given axis lengths and number of axes. A value of -1 in
// axisLengths means it can take any value and is not checked.
//
// It panics if it doesn't match.
//
// See usage example in package atype documentation.
func (at ArrayType) AssertAxisLengths(axisLengths ...int) {
	err := at.CheckAxisLengths(axisLengths...)
	if err != nil {
		panic(fmt.Sprintf("atype.AssertAxisLengths(%v): %+v", axisLengths, err))
	}
}

// Assert checks that the array type has the given dtype, axis lengths and number of axes. A value of -1 in
// axisLengths means it can take any value and is not checked.
//
// It panics if it doesn't match.
func (at ArrayType) Assert(dtype dtype.DType, axisLengths ...int) {
	err := at.Check(dtype, axisLengths...)
	if err != nil {
		panic(fmt.Sprintf("atype.Assert(%s, %v): %+v", dtype, axisLengths, err))
	}
}

// CheckAxisLengths checks that the array type has the given axis lengths and number of axes. A value of -1 in
// axisLengths means it can take any value and is not checked.
//
// It returns an error if the number of axes is different or any of the axis lengths don't match.
func CheckAxisLengths(hat HasArrayType, axisLengths ...int) error {
	return hat.ArrayType().CheckAxisLengths(axisLengths...)
}

// AssertAxisLengths checks that the array type has the given axis lengths and number of axes. A value of -1 in
// axisLengths means it can take any value and is not checked.
//
// It panics if it doesn't match.
//
// See usage example in package atype documentation.
func AssertAxisLengths(hat HasArrayType, axisLengths ...int) {
	hat.ArrayType().AssertAxisLengths(axisLengths...)
}

// Assert checks that the array type has the given dtype, axis lengths and number of axes. A value of -1 in
// axisLengths means it can take any value and is not checked.
//
// It panics if it doesn't match.
func Assert(hat HasArrayType, dtype dtype.DType, axisLengths ...int) {
	hat.ArrayType().Assert(dtype, axisLengths...)
}

// CheckNumAxes checks that the array type has the given number of axes.
//
// It returns an error if the number of axes is different.
func (at ArrayType) CheckNumAxes(numAxes int) error {
	if at.NumAxes() != numAxes {
		return errors.Errorf("array type (%s) has incompatible number of axes %d -- wanted %d", at, at.NumAxes(), numAxes)
	}
	return nil
}

// AssertNumAxes checks that the array type has the given number of axes.
//
// It panics if it doesn't match.
//
// See usage example in package atype documentation.
func (at ArrayType) AssertNumAxes(numAxes int) {
	err := at.CheckNumAxes(numAxes)
	if err != nil {
		panic(fmt.Sprintf("assertNumAxes(%d): %+v", numAxes, err))
	}
}

// CheckNumAxes checks that the array type has the given number of axes.
//
// It returns an error if the number of axes is different.
func CheckNumAxes(hat HasArrayType, numAxes int) error {
	return hat.ArrayType().CheckNumAxes(numAxes)
}

// AssertNumAxes checks that the array type has the given number of axes.
//
// It panics if it doesn't match.
//
// See usage example in package atype documentation.
func AssertNumAxes(hat HasArrayType, numAxes int) {
	hat.ArrayType().AssertNumAxes(numAxes)
}

// CheckScalar checks that the array type is a scalar.
//
// It returns an error if the array type is not a scalar.
func (at ArrayType) CheckScalar() error {
	if !at.IsScalar() {
		return errors.Errorf("array type (%s) is not a scalar", at)
	}
	return nil
}

// AssertScalar checks that the array type is a scalar.
//
// It panics if it doesn't match.
//
// See usage example in package atype documentation.
func (at ArrayType) AssertScalar() {
	err := at.CheckScalar()
	if err != nil {
		panic(fmt.Sprintf("AssertScalar(): %+v", err))
	}
}

// CheckScalar checks that the array type is a scalar.
//
// It returns an error if the array type is not a scalar.
func CheckScalar(hat HasArrayType) error {
	return hat.ArrayType().CheckScalar()
}

// AssertScalar checks that the array type is a scalar.
//
// It panics if it doesn't match.
//
// See usage example in package atype documentation.
func AssertScalar(hat HasArrayType) {
	hat.ArrayType().AssertScalar()
}
