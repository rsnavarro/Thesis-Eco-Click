extends Area2D

const next_level = "res://scenes/UI/Game Clear/game_clear_1.tscn"
var is_collected = false

func _on_body_entered(body):
	if not is_collected:
		is_collected = true
		Global.total_trash == 0

	if body.is_in_group("Player"):
		get_tree().change_scene_to_file(next_level)
