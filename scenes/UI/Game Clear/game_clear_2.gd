class_name GameClear2
extends Control


func _ready():
	AudioPlayer.stop()

func _on_proceed_pressed():
	AudioPlayer.play()
	LevelManager.load_level_(3)

func _on_quit_pressed():
	get_tree().quit()
