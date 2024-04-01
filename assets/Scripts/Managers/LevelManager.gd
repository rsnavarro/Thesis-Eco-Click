extends Node

var levels : Array[LevelData]
var main_scene : Node = null
var loaded_level_1 : Level1 = null
var loaded_level_2 : Level2 = null
var loaded_level_3 : Level3 = null



func unload_level() -> void:
	if is_instance_valid(loaded_level_1):
		loaded_level_1.queue_free()
	elif is_instance_valid(loaded_level_2):
		loaded_level_2.queue_free()
	elif is_instance_valid(loaded_level_3):
		loaded_level_3.queue_free()

	loaded_level_1 = null
	loaded_level_2 = null
	loaded_level_3 = null

func load_level(level_id : int) -> void:
	print("\nLoading Level: %s" % level_id)
	unload_level()
	
	var level_data = get_level_data_by_id(level_id)
	
	if not level_data:
		return
	
	var level_path_1 = "res://scenes/%s.tscn" % level_data.level_path_1
	var level_path_2 = "res://scenes/%s.tscn" % level_data.level_path_2
	var level_path_3 = "res://scenes/%s.tscn" % level_data.level_path_3
	var level_res_1 := load(level_path_1)
	var level_res_2 := load(level_path_2)
	var level_res_3 := load(level_path_3)


	if level_res_1:
		loaded_level_1 = level_res_1.instantiate()
		main_scene.add_child(loaded_level_1)
	elif level_res_2:
		loaded_level_2 = level_res_2.instantiate()
		add_child(loaded_level_2)
		print("Level 2 added to scene tree: ", loaded_level_2.is_inside_tree())
	elif level_res_3:
		loaded_level_3 = level_res_3.instantiate()
		add_child(loaded_level_3)
		print("Level 3 added to scene tree: ", loaded_level_3.is_inside_tree())
	else:
		print("Level does not exist")


func get_level_data_by_id(level_id : int) -> LevelData:
	var level_to_return : LevelData = null
	
	for lvl : LevelData in levels:
		if lvl.level_id == level_id:
			print("\nFound Level Data:")
			print(" Level ID:", lvl.level_id)
			if lvl.level_id == 1:
				print(" Level Path:", lvl.level_path_1)
			elif lvl.level_id == 2:
				print(" Level Path:", lvl.level_path_2)
			else:
				print(" Level Path:", lvl.level_path_3)
			level_to_return = lvl
			break
	return level_to_return
