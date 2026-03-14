extends CharacterBody3D
class_name Player


@export_range(0.0, 1.0) var mouse_sensitivity = 0.005
@export var tilt_limit = deg_to_rad(60)

@onready var model: Node3D = %model
@onready var camera_pivot: Node3D = %camera_pivot
@onready var camera: Camera3D = %camera

const SPEED = 5.0
const JUMP_VELOCITY = 4.5


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	
	var forward := camera_pivot.global_transform.basis.z
	var right := camera_pivot.global_transform.basis.x

	var direction := (forward * input_dir.y + right * input_dir.x).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		var target_angle = atan2(-direction.x, -direction.z)
		model.rotation.y = lerp_angle(model.rotation.y, target_angle, delta * 10.0)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("escape"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _unhandled_input(event: InputEvent) -> void:
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			camera_pivot.rotation.x -= event.relative.y * mouse_sensitivity
			# Prevent the camera from rotating too far up or down.
			camera_pivot.rotation.x = clampf(camera_pivot.rotation.x, -tilt_limit, tilt_limit)
			camera_pivot.rotation.y += -event.relative.x * mouse_sensitivity
	
	elif event.is_action_pressed("mouse_left"):
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
