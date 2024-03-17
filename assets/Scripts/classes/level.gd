class_name Level
extends Node

@export var level_id : int
@export var level_start_pos : Node2D
@export var spawnpoint_1 : Node2D
@export var spawnpoint_2 : Node2D
@export var spawnpoint_3 : Node2D
@export var spawnpoint_4 : Node2D
@export var spawnpoint_5 : Node2D
@export var spawnpoint_6 : Node2D
@export var spawnpoint_7 : Node2D
@export var spawnpoint_8 : Node2D
@export var spawnpoint_9 : Node2D
@export var spawnpoint_10 : Node2D
@export var spawnpoint_11 : Node2D
@export var spawnpoint_12 : Node2D
@export var spawnpoint_13 : Node2D

var level_data : LevelData
func _ready() -> void:
	AudioPlayer.play_music_level()
	level_data = LevelManager.get_level_data_by_id(level_id)
