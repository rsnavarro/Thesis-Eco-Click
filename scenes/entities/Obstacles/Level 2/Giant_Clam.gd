extends CharacterBody2D

var is_alive = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death7")


func _on_clam_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
