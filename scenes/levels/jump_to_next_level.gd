extends Area2D

const next_level = "res://scenes/UI/game_clear.tscn"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(next_level)
