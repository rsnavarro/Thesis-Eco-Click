extends Control

@onready var main = $"../../"


func _on_resume_pressed():
	main.PauseMenu()
	AudioPlayer.play()

func _on_quit_pressed():
	get_tree().quit()
