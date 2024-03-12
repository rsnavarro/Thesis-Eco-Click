extends Control

const next_level = "res://scenes/levels/level_02.tscn"

func _on_proceed_pressed():
	get_tree().change_scene_to_file(next_level)

func _on_quit_pressed():
	get_tree().quit()
