extends Node

@export var available_levels : Array[LevelData]
@onready var game_scene_container = $GameSceneContainer
@onready var open_1_scene_container = $Open1SceneContainer
var main_menu_scene = preload("res://scenes/UI/main_menu.tscn")
@onready var color_rect = $"Opening Scene/ColorRect"
@onready var sprite_2d = $"Opening Scene/Sprite2D"
var opening1_scene = preload("res://scenes/UI/Opening Scenes/opening_1s.tscn")


func _ready() -> void:
	$"Opening Scene/AnimationPlayer".play("Fade in")
	await get_tree().create_timer(6).timeout
	$"Opening Scene/AnimationPlayer".play("Fade out")
	await get_tree().create_timer(3).timeout
	sprite_2d.queue_free()
	color_rect.queue_free()

	LevelManager.main_scene = game_scene_container
	LevelManager.opening_scene_1 = open_1_scene_container
	LevelManager.levels = available_levels


	var main_menu_instance = main_menu_scene.instantiate()
	get_tree().root.add_child(main_menu_instance)
	#add_child(main_menu_instance)

	#var opening1_instance = opening1_scene.instantiate()
	#get_tree().root.add_child(opening1_instance)
	##add_child(opening1_instance)
