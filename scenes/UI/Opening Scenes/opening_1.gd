class_name Opening1
extends Control

@export var level_id : int = 19
@onready var color_rect = $ColorRect

func _ready():
	$AnimationPlayer.play("Opening_1 fade in")
	await get_tree().create_timer(6).timeout
	color_rect.queue_free()

func _on_continue_pressed():
	LevelManager.load_level(20)
	deactivate()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
