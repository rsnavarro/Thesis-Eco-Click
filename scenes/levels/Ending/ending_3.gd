class_name Ending3
extends Control

@export var level_id : int = 24
@onready var color_rect = $ColorRect
@onready var texture_rect = $TextureRect


func _ready():
	AudioPlayer.stop()
	$AnimationPlayer.play("Ending_3 fade in")
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("Ending_3 fade out")
	await get_tree().create_timer(6).timeout
	texture_rect.queue_free()
	color_rect.queue_free()
