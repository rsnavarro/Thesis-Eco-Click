class_name Level3
extends Node

@export var level_id : int = 3
#@export var spawnpoint_1 : Node2D
#@export var spawnpoint_2 : Node2D
#@export var spawnpoint_3 : Node2D
#@export var spawnpoint_4 : Node2D
#
##Danger Zones Level 1
#@export var DZ_S1 : Node2D
#@export var DZ_S2 : Node2D
#@export var DZ_S3 : Node2D
#@export var DZ_S4 : Node2D
#@export var DZ_S5 : Node2D
#@export var DZ_S6 : Node2D
#@export var DZ_S7 : Node2D
#@export var DZ_S8 : Node2D
#@export var DZ_S9 : Node2D
#@export var DZ_S10 : Node2D
#@export var DZ_S11 : Node2D
#@export var DZ_S12 : Node2D
#
##Danger Zones Level 2
#@export var DZ_S13 : Node2D
#@export var DZ_S14 : Node2D
#@export var DZ_S15 : Node2D
#@export var DZ_S16 : Node2D
#@export var DZ_S17 : Node2D
#@export var DZ_S18 : Node2D
#@export var DZ_S19 : Node2D
#@export var DZ_S20 : Node2D
#@export var DZ_S21 : Node2D
#@export var DZ_S22 : Node2D
#@export var DZ_S23 : Node2D
#@export var DZ_S24 : Node2D
#@export var DZ_S25 : Node2D
#@export var DZ_S26 : Node2D


var level_data : LevelData
func _ready() -> void:
	AudioPlayer.play_music_level()
	level_data = LevelManager.get_level_data_by_id(level_id)
