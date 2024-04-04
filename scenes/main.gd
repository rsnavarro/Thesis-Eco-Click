extends Node

@export var available_levels : Array[LevelData]
@onready var game_scene_container = $GameSceneContainer
var main_menu_scene = preload("res://scenes/UI/main_menu.tscn")

func _ready() -> void:
	LevelManager.main_scene = game_scene_container
	LevelManager.levels = available_levels

	var main_menu_instance = main_menu_scene.instantiate()
	add_child(main_menu_instance)
