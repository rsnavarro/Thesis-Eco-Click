extends CharacterBody2D

var is_alive = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death9")
