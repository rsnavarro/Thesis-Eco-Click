class_name Level2
extends Node

@export var level_id : int = 2
#Obstacle Spawn Points
@export var spawnpoint_5 : Node2D
@export var spawnpoint_6 : Node2D
@export var spawnpoint_7 : Node2D
@export var spawnpoint_8 : Node2D

#Danger Zones Level 2
@export var DZ_S13 : Node2D
@export var DZ_S14 : Node2D
@export var DZ_S15 : Node2D
@export var DZ_S16 : Node2D
@export var DZ_S17 : Node2D
@export var DZ_S18 : Node2D
@export var DZ_S19 : Node2D
@export var DZ_S20 : Node2D
@export var DZ_S21 : Node2D
@export var DZ_S22 : Node2D
@export var DZ_S23 : Node2D
@export var DZ_S24 : Node2D
@export var DZ_S25 : Node2D
@export var DZ_S26 : Node2D


var level_data : LevelData
func _ready() -> void:
	AudioPlayer.play_music_level()
	level_data = LevelManager.get_level_data_by_id(level_id)
