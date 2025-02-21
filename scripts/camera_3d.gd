extends Camera3D

@export var move_speed: float = 5.0
@export var look_sensitivity: float = 0.004

var velocity := Vector3.ZERO

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	# Mouse Look
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * look_sensitivity)
		var x_rotation = -event.relative.y * look_sensitivity
		var new_rotation = rotation_degrees.x + rad_to_deg(x_rotation)
		rotation_degrees.x = clamp(new_rotation, -90, 90)

func _process(delta: float) -> void:
	position.y += Input.get_axis("down","up")*delta*5.0
