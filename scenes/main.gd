extends Node

@export var available_levels : Array[LevelData]
@onready var GameSceneContainer = $"2DScene"
var main_menu_scene = preload("res://scenes/UI/main_menu.tscn")

func _ready() -> void:
	LevelManager.main_scene = GameSceneContainer
	LevelManager.levels = available_levels

	var main_menu_instance = main_menu_scene.instantiate()
	add_child(main_menu_instance)
