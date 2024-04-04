class_name GameClear1
extends Control


func _ready():
	AudioPlayer.stop()

func _on_proceed_pressed():
	AudioPlayer.play()
	LevelManager.load_level(2)
	deactivate()

func _on_quit_pressed():
	get_tree().quit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
