class_name Ending3
extends Control

@export var level_id : int = 24
@onready var color_rect_3 = $ColorRect3
@onready var texture_rect_3 = $TextureRect3
@onready var label_3 = $Label3


func _ready():
	AudioPlayer.stop()
	$AnimationPlayer.play("Ending_3 fade in")
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("Ending_3 fade out")
	await get_tree().create_timer(20).timeout
	color_rect_3.queue_free()
	texture_rect_3.queue_free()
	label_3.queue_free()
	get_tree().quit()
