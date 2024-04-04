class_name  EndGame
extends Area2D

func _ready():
	AudioPlayer.stop()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		LevelManager.load_level(9)
