extends Node

@export var available_levels : Array[LevelData]
@onready var intro_scene_container = $IntroSceneContainer
@onready var game_scene_container = $GameSceneContainer
var main_menu_scene = preload("res://scenes/UI/main_menu.tscn")
@onready var color_rect = $ColorRect
@onready var sprite_2d = $Sprite2D


func _ready() -> void:
	$AnimationPlayer.play("Fade in")
	await get_tree().create_timer(6).timeout
	$AnimationPlayer.play("Fade out")
	await get_tree().create_timer(3).timeout
	sprite_2d.queue_free()
	color_rect.queue_free()

	LevelManager.main_scene = game_scene_container
	LevelManager.levels = available_levels

	var main_menu_instance = main_menu_scene.instantiate()
	add_child(main_menu_instance)
