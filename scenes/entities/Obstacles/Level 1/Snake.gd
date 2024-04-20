extends CharacterBody2D

const SPEED = 25.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_alive = true
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var floor_ray_cast_right = $Floor_Checks/Floor_RayCast_Right
@onready var floor_ray_cast_left = $Floor_Checks/Floor_RayCast_Left

func _physics_process(delta):
	#var direction_right
	#var direction_left
#
	#if direction_right:
		#velocity.y += gravity * delta
		#velocity.x = SPEED
		#
	#elif direction_left:
		#velocity.y += gravity * delta
		#velocity.x = -SPEED

	if not is_on_floor():
		velocity.y += gravity * delta
	elif is_on_floor():
		velocity.y += gravity * delta
		velocity.x = SPEED
		if not floor_ray_cast_right.is_colliding():
			floor_ray_cast_right.scale.x *= -1.0
			animated_sprite_2d.flip_h = true
			velocity.x = -SPEED
		elif not floor_ray_cast_left.is_colliding():
			floor_ray_cast_left.scale.x *= 1.0
			animated_sprite_2d.flip_h = true
			velocity.x = SPEED


	move_and_slide()

func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death4")

func _on_snake_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
