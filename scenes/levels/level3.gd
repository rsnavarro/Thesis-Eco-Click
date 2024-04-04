class_name Level3
extends Node

@export var level_id : int = 3
#@export var spawnpoint_1 : Node2D
#@export var spawnpoint_2 : Node2D
#@export var spawnpoint_3 : Node2D
#@export var spawnpoint_4 : Node2D


#Danger Zones Level 3
@export var DZ_S27 : Node2D
@export var DZ_S28 : Node2D
@export var DZ_S29 : Node2D
@export var DZ_S30 : Node2D
@export var DZ_S31 : Node2D
@export var DZ_S32 : Node2D
@export var DZ_S33 : Node2D
@export var DZ_S34 : Node2D
@export var DZ_S35 : Node2D
@export var DZ_S36 : Node2D
@export var DZ_S37 : Node2D
@export var DZ_S38 : Node2D
@export var DZ_S39 : Node2D
@export var DZ_S40 : Node2D
@export var DZ_S41 : Node2D
@export var DZ_S42 : Node2D
@export var DZ_S43 : Node2D
@export var DZ_S44 : Node2D
@export var DZ_S45 : Node2D
@export var DZ_S46 : Node2D
@export var DZ_S47 : Node2D
@export var DZ_S48 : Node2D
@export var DZ_S49 : Node2D
@export var DZ_S50 : Node2D


var level_data : LevelData
func _ready() -> void:
	AudioPlayer.play_music_level()
	level_data = LevelManager.get_level_data_by_id(level_id)
