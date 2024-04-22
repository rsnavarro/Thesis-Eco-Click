class_name Ending1
extends Control

@export var level_id : int = 22

@onready var texture_rect = $"1/TextureRect"
@onready var label = $"1/Label"
@onready var color_rect = $"1/ColorRect"
@onready var texture_rect_2 = $"2/TextureRect2"
@onready var label_2 = $"2/Label2"
@onready var color_rect_2 = $"2/ColorRect2"
@onready var texture_rect_3 = $"3/TextureRect3"
@onready var label_3 = $"3/Label3"
@onready var color_rect_3 = $"3/ColorRect3"


func _ready():
	AudioPlayer.stop()
	$AnimationPlayer.play("Ending_1 fade in")
	await get_tree().create_timer(6).timeout
	#$AnimationPlayer.play("Ending_1 fade out")
	#await get_tree().create_timer(3).timeout
	texture_rect.queue_free()
	label.queue_free()
	color_rect.queue_free()
	texture_rect_2.queue_free()
	label_2.queue_free()
	color_rect_2.queue_free()
	texture_rect_3.queue_free()
	label_3.queue_free()
	color_rect_3.queue_free()
