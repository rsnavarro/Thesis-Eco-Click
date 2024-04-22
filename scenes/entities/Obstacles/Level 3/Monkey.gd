extends CharacterBody2D

const SPEED = 25.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_alive = true
var direction_right = false
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var floor_ray_cast_left = $Floor_Checks/Floor_RayCast_Left
@onready var floor_ray_cast_right = $Floor_Checks/Floor_RayCast_Right


func _physics_process(delta):
	if is_on_floor():
		if direction_right:
			velocity.x = SPEED
			animated_sprite_2d.flip_h = true
		else:
			velocity.x = -SPEED
			animated_sprite_2d.flip_h = false
	else:
		velocity.x = 0

	velocity.y += gravity * delta

	if is_on_floor():
		if direction_right and not floor_ray_cast_right.is_colliding():
			direction_right = false
		elif not direction_right and not floor_ray_cast_left.is_colliding():
			direction_right = true

	move_and_slide()

func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death4")

func _on_monkey_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
