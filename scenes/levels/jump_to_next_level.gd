extends Area2D

const FILE_BEGIN = "res://scenes/levels/level_0"
const current_scene_file = "res://scenes/levels/level_01.tscn"
func _on_body_entered(body):
	if body.is_in_group("Player"):
		var next_level_number = current_scene_file.to_int() + 1
		var next_level_path = FILE_BEGIN + str(next_level_number) + ".tscn"
		get_tree().change_scene_to_file(next_level_path)
