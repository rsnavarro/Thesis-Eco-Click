extends CharacterBody2D


const SPEED = 25.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_alive = true


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x = -SPEED

	move_and_slide()


func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death10")


func _on_iguana_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
