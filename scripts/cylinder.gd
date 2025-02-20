extends Node3D

func _ready() -> void:
	$cylinder.rotation_degrees.z = randf_range(0.0,360.0)

func _process(delta: float) -> void:
	var realdelta: float = delta*Globals.deltamultiplier
	$cylinder.rotation_degrees.z += realdelta*Globals.cylinderspin
