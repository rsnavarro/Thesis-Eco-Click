extends CanvasLayer

const target = "res://scenes/levels/level_01.tscn"
func change_scene_to_file(target: String) -> void:
	$AnimationPlayer.play('dissolve')
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('dissolve')
