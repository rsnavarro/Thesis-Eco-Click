extends Area2D

const next_level = "res://scenes/UI/Game Clear/game_clear_2.tscn"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		Lvl2To3.change_scene_to_file(next_level)
