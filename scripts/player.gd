extends CharacterBody3D
class_name VoxelPlayer

@export var walk_speed := 5.0
@export var sprint_speed := 7.0
@export var jump_velocity := 7.2
@export var mouse_sensitivity := 0.0025

@onready var head: Node3D = $Head

var gravity := 19.0

func _ready() -> void:
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
        rotate_y(-event.relative.x * mouse_sensitivity)
        head.rotate_x(-event.relative.y * mouse_sensitivity)
        head.rotation.x = clamp(head.rotation.x, -1.5, 1.5)
    elif event is InputEventKey and event.pressed and event.keycode == KEY_ESCAPE:
        Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity.y -= gravity * delta
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_velocity

    var input_vec := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
    var direction := (transform.basis * Vector3(input_vec.x, 0, input_vec.y)).normalized()
    var speed := sprint_speed if Input.is_action_pressed("sprint") else walk_speed
    velocity.x = move_toward(velocity.x, direction.x * speed, 30.0 * delta)
    velocity.z = move_toward(velocity.z, direction.z * speed, 30.0 * delta)
    move_and_slide()
