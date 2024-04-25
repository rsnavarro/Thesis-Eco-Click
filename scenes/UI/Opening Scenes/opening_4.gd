class_name Opening4
extends Control

@export var level_id : int = 25
@onready var game_scene_container = $GameSceneContainer
var main_menu_scene = preload("res://scenes/UI/main_menu.tscn")
@onready var color_rect_5 = $ColorRect5


func _ready() -> void:
	$AnimationPlayer.play("Opening_4 fade in")
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("Opening_4 fade out")
	await get_tree().create_timer(6).timeout
	color_rect_5.queue_free()
	LevelManager.main_scene = game_scene_container

func _on_continue_pressed():
	var main_menu_instance = main_menu_scene.instantiate()
	get_tree().root.add_child(main_menu_instance)
	deactivate()

func deactivate() -> void:
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)
