extends Control


func _ready():
	AudioPlayer.stop()

func _on_restart_pressed():
	AudioPlayer.play()
	Global.reset_trash()
	get_tree().change_scene_to_file("res://scenes/levels/level_03.tscn")

func _on_quit_pressed():
	get_tree().quit()
