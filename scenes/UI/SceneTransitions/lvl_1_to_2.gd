extends CanvasLayer

const target = "res://scenes/UI/Game Clear/game_clear_1.tscn"
func change_scene_to_file(target: String) -> void:
	$AnimationPlayer.play('dissolve')
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('dissolve')
