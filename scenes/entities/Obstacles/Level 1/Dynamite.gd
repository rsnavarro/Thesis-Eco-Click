extends CharacterBody2D

var is_alive = true
var has_played_explosion = false
@onready var animated_sprite_2d = $AnimatedSprite2D


func _on_body_entered(body):
	print("Player collided with a bomb")
	if body is Player:
		animated_sprite_2d.play("Explosion")
		await get_tree().create_timer(2).timeout
		has_played_explosion = true
		body.call("on_death1")

func _on_dynamite_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
