package array

import (
	"github.com/pkg/errors"
)

// AxisShard represents a half-open interval [Start, End) along a single axis.
//
// It is valid for Start == End (empty along that axis). End must be >= Start.
type AxisShard struct {
	Start int
	End   int
}

// NewAxisShard constructs an AxisShard and validates it against an axis length.
//
// It enforces 0 <= start <= end <= axisLen.
func NewAxisShard(start, end, axisLen int) (AxisShard, error) {
	if axisLen < 0 {
		return AxisShard{}, errors.Errorf("NewAxisShard: axisLen must be >= 0, got %d", axisLen)
	}
	if start < 0 || end < 0 {
		return AxisShard{}, errors.Errorf("NewAxisShard: start/end must be >= 0, got start=%d end=%d", start, end)
	}
	if end < start {
		return AxisShard{}, errors.Errorf("NewAxisShard: end must be >= start, got start=%d end=%d", start, end)
	}
	if end > axisLen {
		return AxisShard{}, errors.Errorf("NewAxisShard: end out of bounds, got end=%d with axisLen=%d", end, axisLen)
	}
	return AxisShard{Start: start, End: end}, nil
}

// Validate checks the shard against an axis length.
func (a AxisShard) Validate(axisLen int) error {
	_, err := NewAxisShard(a.Start, a.End, axisLen)
	return err
}

// Length returns End-Start.
func (a AxisShard) Length() int {
	return a.End - a.Start
}

// Shard indicates, for each axis, which shard of the full array is included.
//
// The number of axes in the shard is len(Shard).
// Each axis shard is a half-open interval [Start, End).
type Shard []AxisShard

// Lengths returns the lengths of the axes in the shard.
func (s Shard) Lengths() []int {
	lengths := make([]int, len(s))
	for i, axis := range s {
		lengths[i] = axis.Length()
	}
	return lengths
}

// NewShard constructs a (generic) Shard and validates it against the full array axes.
//
// It enforces:
//   - len(axisShards) == len(axes)
//   - for each axis i: 0 <= Start <= End <= axes[i].Length
func NewShard(axes Axes, axisShards []AxisShard) (Shard, error) {
	if len(axisShards) != len(axes) {
		return nil, errors.Errorf("NewShard: axisShards has %d axes, want %d", len(axisShards), len(axes))
	}
	out := make(Shard, len(axisShards))
	for i, as := range axisShards {
		axisShard, err := NewAxisShard(as.Start, as.End, axes[i].Length)
		if err != nil {
			return nil, errors.Wrapf(err, "NewShard: invalid shard for axis %d", i)
		}
		out[i] = axisShard
	}
	return out, nil
}

// NumAxes returns the number of axes described by the shard.
func (s Shard) NumAxes() int { return len(s) }

// Size returns the number of elements (not bytes) included by this shard.
//
// For scalars (NumAxes==0), the shard contains exactly one element.
// If any axis shard has length 0, Size returns 0.
func (s Shard) Size() int {
	if len(s) == 0 {
		return 1 // Scalar has one element.
	}
	size := 1
	for _, axis := range s {
		axisLen := axis.Length()
		if axisLen == 0 {
			return 0
		}
		size *= axisLen
	}
	return size
}

// IsEmpty reports whether this shard contains zero elements.
func (s Shard) IsEmpty() bool { return s.Size() == 0 }

// FullShard returns a shard that includes the whole array with the given axes.
func FullShard(axes Axes) Shard {
	shard := make(Shard, len(axes))
	for i, axis := range axes {
		if axis.Length < 0 {
			// this should never happen
			panic("FullShard: axis length must be >= 0")
		}
		shard[i] = AxisShard{Start: 0, End: axis.Length}
	}
	return shard
}

// EmptyShard returns an empty shard (zero elements) for an array with numAxes axes.
func EmptyShard(numAxes int) Shard {
	if numAxes < 0 {
		panic("EmptyShard: numAxes must be >= 0")
	}
	shard := make(Shard, numAxes)
	for i := 0; i < numAxes; i++ {
		shard[i] = AxisShard{Start: 0, End: 0}
	}
	return shard
}
