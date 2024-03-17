extends CharacterBody2D

const SPEED = 25.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_alive = true

const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	var down = Vector2.DOWN  # Start by moving upwards
	#if not is_on_floor():
		## If not on the ground, reverse direction
		#direction = -direction
	## Apply movement with speed
	#velocity = direction * SPEED

	if not is_on_floor():
		velocity.y = -SPEED
	velocity = down * SPEED
	
	move_and_slide()

func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death6")

func _on_jellyfish_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
