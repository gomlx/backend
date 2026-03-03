package array

import (
	"slices"

	"github.com/pkg/errors"
)

type Device int

type Devices []Device

// Placement describes where (and which part of) an array lives across devices.
//
// Axes describes the full array axes, and Shards maps each device number to the shard
// of the array placed on that device.
type Placement struct {
	Axes Axes
	// TODO: Should we allow representing non-allocated devices via non-existence (vs EmptyShard)?
	Shards map[Device]Shard
}

// SingletonPlacement returns a placement where the full array is placed on onDevice,
// and every device in allDevices (except onDevice) gets an empty shard.
//
// Returns an error if onDevice is not in allDevices.
func SingletonPlacement(axes Axes, onDevice Device, allDevices []Device) (Placement, error) {
	if !slices.Contains(allDevices, onDevice) {
		return Placement{}, errors.Errorf("SingletonPlacement: onDevice %d is not in allDevices", onDevice)
	}
	p := Placement{
		Axes:   axes,
		Shards: make(map[Device]Shard, len(allDevices)),
	}
	p.Shards[onDevice] = FullShard(axes)
	for _, d := range allDevices {
		if d == onDevice {
			continue
		}
		p.Shards[d] = EmptyShard(len(axes))
	}
	return p, nil
}

// FullyReplicated returns a placement where the full array is placed on each device.
func FullyReplicated(axes Axes, devices []Device) Placement {
	p := Placement{
		Axes:   axes,
		Shards: make(map[Device]Shard, len(devices)),
	}
	for _, d := range devices {
		p.Shards[d] = FullShard(axes)
	}
	return p
}
