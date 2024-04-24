class_name Ending1
extends Control

@export var level_id : int = 22


func _ready():
	AudioPlayer.stop()
	$AnimationPlayer.play("Ending_1 fade in")
	await get_tree().create_timer(6).timeout


func _on_proceed_pressed():
	LevelManager.load_level(23)
