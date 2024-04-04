class_name  ToLevel3
extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		Global.reset_trash()
		LevelManager.load_level(5)
