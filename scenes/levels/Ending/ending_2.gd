class_name Ending2
extends Control

@export var level_id : int = 23
@onready var color_rect_2 = $ColorRect2

func _ready():
	AudioPlayer.stop()
	$AnimationPlayer.play("Ending_2 fade in")
	await get_tree().create_timer(6).timeout
	color_rect_2.queue_free()


func _on_continue_pressed():
	LevelManager.load_level(24)
