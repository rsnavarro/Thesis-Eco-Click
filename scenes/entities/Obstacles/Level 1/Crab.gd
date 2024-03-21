extends CharacterBody2D

const SPEED = 25.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_alive = true
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var floor_ray_cast_left = $Floor_Checks/Floor_RayCast_Left
@onready var wall_ray_cast_left = $Wall_Checks/Wall_RayCast_Left


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		velocity.x = SPEED
	elif (is_on_floor() and floor_ray_cast_left.is_colliding()):
		floor_ray_cast_left.scale.x *= -1.0
	else:
		animated_sprite_2d.flip_h = false
		velocity.x = -SPEED

	move_and_slide()


func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death2")


func _on_crab_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
