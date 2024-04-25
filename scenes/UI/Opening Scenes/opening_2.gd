class_name Opening2
extends Control

@export var level_id : int = 20
@onready var color_rect_2 = $ColorRect2

func _ready():
	$AnimationPlayer.play("Opening_2 fade in")
	await get_tree().create_timer(5).timeout
	color_rect_2.queue_free()

func _on_continue_pressed():
	LevelManager.load_level(21)
	deactivate()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
