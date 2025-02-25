extends Camera3D

@export var move_speed: float = 5.0
@export var look_sensitivity: float = 0.004

var velocity := Vector3.ZERO

const deg2rad: float = PI/180.0
const rad2deg: float = 180.0/PI

var zoom: float = 75.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * look_sensitivity)
		var x_rotation = -event.relative.y * look_sensitivity
		var new_rotation = rotation_degrees.x + rad_to_deg(x_rotation)
		rotation_degrees.x = clamp(new_rotation, -90, 90)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			fov *= 0.975
			fov = max(10.0,fov)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			fov *= 1.02
			fov = min(160.0,fov)
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			fov = 75.0

func _process(delta: float) -> void:
	position.y += Input.get_axis("down","up")*delta*10.0
	
	var delta2: float = delta * 10.0
	
	if Input.is_key_pressed(KEY_S):
		position.x += delta2 * sin(rotation_degrees.y*deg2rad)
		position.z += delta2 * cos(rotation_degrees.y*deg2rad)
	if Input.is_key_pressed(KEY_W):
		position.x -= delta2 * sin(rotation_degrees.y*deg2rad)
		position.z -= delta2 * cos(rotation_degrees.y*deg2rad)
	if Input.is_key_pressed(KEY_A):
		position.x -= delta2 * cos(rotation_degrees.y*deg2rad)
		position.z += delta2 * sin(rotation_degrees.y*deg2rad)
	if Input.is_key_pressed(KEY_D):
		position.x += delta2 * cos(rotation_degrees.y*deg2rad)
		position.z -= delta2 * sin(rotation_degrees.y*deg2rad)
