extends Node

var levels : Array[LevelData]
var main_scene : Node = null
var loaded_level_1 : Level1 = null
var loaded_level_2 : Level2 = null
var loaded_level_3 : Level3 = null
var loaded_clear_1 : GameClear1 = null
var loaded_clear_2 : GameClear2 = null
var loaded_over_1 : GameOver1 = null
var loaded_over_2 : GameOver2 = null
var loaded_over_3 : GameOver3 = null
var loaded_finish_1 : FinishLine = null


func unload_level() -> void:
	if is_instance_valid(loaded_level_1):
		loaded_level_1.queue_free()
	elif is_instance_valid(loaded_level_2):
		loaded_level_2.queue_free()
	elif is_instance_valid(loaded_level_3):
		loaded_level_3.queue_free()
	elif is_instance_valid(loaded_clear_1):
		loaded_clear_1.queue_free()
	elif is_instance_valid(loaded_clear_2):
		loaded_clear_2.queue_free()
	elif is_instance_valid(loaded_over_1):
		loaded_over_1.queue_free()
	elif is_instance_valid(loaded_over_2):
		loaded_over_2.queue_free()
	elif is_instance_valid(loaded_over_3):
		loaded_over_3.queue_free()
	elif is_instance_valid(loaded_finish_1):
		loaded_finish_1.queue_free()

	loaded_level_1 = null
	loaded_level_2 = null
	loaded_level_3 = null
	loaded_clear_1 = null
	loaded_clear_2 = null
	loaded_over_1 = null
	loaded_over_2 = null
	loaded_over_3 = null
	loaded_finish_1 = null

func load_level(level_id : int) -> void:
	print("\nLoading Level: %s" % level_id)
	unload_level()
	
	var level_data = get_level_data_by_id(level_id)
	
	if not level_data:
		return
	
	var level_path_1 = "res://scenes/%s.tscn" % level_data.level_path_1
	var level_path_2 = "res://scenes/%s.tscn" % level_data.level_path_2
	var level_path_3 = "res://scenes/%s.tscn" % level_data.level_path_3
	var game_clear_path_1 = "res://scenes/%s.tscn" % level_data.game_clear_path_1
	var game_clear_path_2 = "res://scenes/%s.tscn" % level_data.game_clear_path_2
	var game_over_path_1 = "res://scenes/%s.tscn" % level_data.game_over_path_1
	var game_over_path_2 = "res://scenes/%s.tscn" % level_data.game_over_path_2
	var game_over_path_3 = "res://scenes/%s.tscn" % level_data.game_over_path_3
	var finish_line_path_1 = "res://scenes/%s.tscn" % level_data.finish_line_path_1

	var level_res_1 := load(level_path_1)
	var level_res_2 := load(level_path_2)
	var level_res_3 := load(level_path_3)
	var clear_res_1 := load(game_clear_path_1)
	var clear_res_2 := load(game_clear_path_2)
	var over_res_1 := load(game_over_path_1)
	var over_res_2 := load(game_over_path_2)
	var over_res_3 := load(game_over_path_3)
	var finish_res_1 := load(finish_line_path_1)

#Levels
	if level_res_1:
		loaded_level_1 = level_res_1.instantiate()
		get_tree().root.add_child(loaded_level_1, false)
	elif level_res_2:
		loaded_level_2 = level_res_2.instantiate()
		get_tree().root.add_child(loaded_level_2, false)
	elif level_res_3:
		loaded_level_3 = level_res_3.instantiate()
		get_tree().root.add_child(loaded_level_3, false)
#Game Clear
	elif clear_res_1:
		loaded_clear_1 = clear_res_1.instantiate()
		get_tree().root.add_child(loaded_clear_1, false)
	elif clear_res_2:
		loaded_clear_2 = clear_res_2.instantiate()
		get_tree().root.add_child(loaded_clear_2, false)
#Game Over
	elif over_res_1:
		loaded_over_1 = over_res_1.instantiate()
		get_tree().root.add_child(loaded_over_1, false)
	elif over_res_2:
		loaded_over_2 = over_res_2.instantiate()
		get_tree().root.add_child(loaded_over_2, false)
	elif over_res_3:
		loaded_over_3 = over_res_3.instantiate()
		get_tree().root.add_child(loaded_over_3, false)
#Finish Line
	elif finish_res_1:
		loaded_finish_1 = finish_res_1.instantiate()
		get_tree().root.add_child(loaded_finish_1, false)
	else:
		print("Level does not exist")


func get_level_data_by_id(id : int) -> LevelData:
	var level_to_return : LevelData = null
	
	for lvl : LevelData in levels:
		if lvl.level_id == id:
			print("\nFound Level Data:")
			print(" Level ID:", lvl.level_id)
			if lvl.level_id == 1:
				print(" Level Path:", lvl.level_path_1)
			elif lvl.level_id == 2:
				print(" Level Path:", lvl.level_path_2)
			elif lvl.level_id == 3:
				print(" Level Path:", lvl.level_path_3)
			elif lvl.level_id == 4:
				print(" Level Path:", lvl.game_clear_path_1)
			else:
				print(" Level Path:", lvl.game_clear_path_2)
			level_to_return = lvl
			break
	return level_to_return
