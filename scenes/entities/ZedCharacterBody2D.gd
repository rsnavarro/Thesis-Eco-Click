extends CharacterBody2D

@export var speed : float = 275.0
@export var jump_force : float = -300.0
@export var jump_time : float = 0.25
@export var coyote_time : float = 0.075
@export var gravity_multiplier : float = 3.0
@export var double_jump_force : float = -350.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_double_jump : bool = false
var double_jump_timer : float = 0.0
var num_jumps : int = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_force
			num_jumps = 1
			can_double_jump = true
		elif can_double_jump and num_jumps < 2:
			velocity.y = double_jump_force
			num_jumps += 1
			can_double_jump = false
			double_jump_timer = 0.0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()

func _process(delta):
	if not is_on_floor():
		double_jump_timer += delta
		if double_jump_timer > coyote_time:
			can_double_jump = true
