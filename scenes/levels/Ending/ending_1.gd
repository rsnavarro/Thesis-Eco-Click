class_name Ending1
extends Control

@export var level_id : int = 19
@onready var sprite_2d = $Sprite2D
@onready var color_rect = $ColorRect


func _ready():
	AudioPlayer.stop()
	$AnimationPlayer.play("Fade in")
	await get_tree().create_timer(6).timeout
	$AnimationPlayer.play("Fade out")
	await get_tree().create_timer(3).timeout
	sprite_2d.queue_free()
	color_rect.queue_free()
