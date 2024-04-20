class_name GameOver2
extends Control

@export var level_id : int = 17

func _ready():
	AudioPlayer.stop()

func _on_restart_pressed():
	AudioPlayer.play()
	Global.reset_trash()
	LevelManager.load_level(2)
	deactivate()

func _on_quit_pressed():
	get_tree().quit()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
