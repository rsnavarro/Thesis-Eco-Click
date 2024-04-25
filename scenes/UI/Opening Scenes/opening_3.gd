class_name Opening3
extends Control

@export var level_id : int = 21
@onready var color_rect_3 = $ColorRect3

func _ready() -> void:
	$AnimationPlayer.play("Opening_3 fade in")
	await get_tree().create_timer(6).timeout
	color_rect_3.queue_free()

func _on_continue_pressed():
	LevelManager.load_level(25)
	deactivate()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
