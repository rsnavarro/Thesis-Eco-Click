extends CharacterBody2D

const SPEED = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_alive = true
var direction_right = true
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var wall_ray_cast_left = $Wall_Checks/Wall_RayCast_Left
@onready var wall_ray_cast_right = $Wall_Checks/Wall_RayCast_Right
@onready var floor_ray_cast_left = $Floor_Checks/Floor_RayCast_Left
@onready var floor_ray_cast_right = $Floor_Checks/Floor_RayCast_Right

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.x = SPEED
	elif is_on_floor():
		if direction_right:
			velocity.x = SPEED
			animated_sprite_2d.flip_h = true
			if wall_ray_cast_right.is_colliding() or not floor_ray_cast_right.is_colliding():
				direction_right = false
		else:
			velocity.x = -SPEED
			animated_sprite_2d.flip_h = false
			if wall_ray_cast_left.is_colliding() or not floor_ray_cast_left.is_colliding():
				direction_right = true

	move_and_slide()

func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death2")

func _on_crab_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()

func _on_wall_ray_cast_left_body_entered(body):
	if body.is_in_group("Wall"):
		direction_right = true

func _on_wall_ray_cast_right_body_entered(body):
	if body.is_in_group("Wall"):
		direction_right = false
