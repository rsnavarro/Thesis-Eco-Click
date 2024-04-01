extends Control


func _ready():
	AudioPlayer.stop()

func _on_proceed_pressed():
	AudioPlayer.play()
	LevelManager.load_level(2)

func _on_quit_pressed():
	get_tree().quit()
