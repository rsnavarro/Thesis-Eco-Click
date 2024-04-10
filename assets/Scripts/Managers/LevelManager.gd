extends Node

var levels : Array[LevelData]
var main_scene : Node = null
var loaded_level_1 : Level1 = null
var loaded_level_2 : Level2 = null
var loaded_level_3 : Level3 = null

var loaded_clear_1_1 : Lvl1Star1 = null
var loaded_clear_1_2 : Lvl1Star2 = null
var loaded_clear_1_3 : Lvl1Star3 = null

var loaded_clear_2_1 : Lvl2Star1 = null

var loaded_clear_3_1 : Lvl3Star1 = null

var loaded_over_1 : GameOver1 = null
var loaded_over_2 : GameOver2 = null
var loaded_over_3 : GameOver3 = null


func unload_level() -> void:
	if is_instance_valid(loaded_level_1):
		loaded_level_1.queue_free()
	elif is_instance_valid(loaded_level_2):
		loaded_level_2.queue_free()
	elif is_instance_valid(loaded_level_3):
		loaded_level_3.queue_free()

	elif is_instance_valid(loaded_clear_1_1):
		loaded_clear_1_1.queue_free()
	elif is_instance_valid(loaded_clear_1_2):
		loaded_clear_1_2.queue_free()
	elif is_instance_valid(loaded_clear_1_3):
		loaded_clear_1_3.queue_free()
		
	elif is_instance_valid(loaded_clear_2_1):
		loaded_clear_2_1.queue_free()
	elif is_instance_valid(loaded_clear_3_1):
		loaded_clear_3_1.queue_free()

	elif is_instance_valid(loaded_over_1):
		loaded_over_1.queue_free()
	elif is_instance_valid(loaded_over_2):
		loaded_over_2.queue_free()
	elif is_instance_valid(loaded_over_3):
		loaded_over_3.queue_free()

	loaded_level_1 = null
	loaded_level_2 = null
	loaded_level_3 = null
	
	loaded_clear_1_1 = null
	loaded_clear_1_2 = null
	loaded_clear_1_3 = null
	
	loaded_clear_2_1 = null
	
	loaded_clear_3_1 = null

	loaded_over_1 = null
	loaded_over_2 = null
	loaded_over_3 = null

func load_level(level_id : int) -> void:
	print("\nLoading Level: %s" % level_id)
	unload_level()
	
	var level_data = get_level_data_by_id(level_id)
	
	if not level_data:
		return
	
	var level_path_1 = "res://scenes/%s.tscn" % level_data.level_path_1
	var level_path_2 = "res://scenes/%s.tscn" % level_data.level_path_2
	var level_path_3 = "res://scenes/%s.tscn" % level_data.level_path_3

	var lvl1_1_star = "res://scenes/%s.tscn" % level_data.lvl1_1_star
	var lvl1_2_star = "res://scenes/%s.tscn" % level_data.lvl1_2_star
	var lvl1_3_star = "res://scenes/%s.tscn" % level_data.lvl1_3_star
	
	var lvl2_1_star = "res://scenes/%s.tscn" % level_data.lvl2_1_star
	var lvl3_1_star = "res://scenes/%s.tscn" % level_data.lvl3_1_star
	
	var game_over_path_1 = "res://scenes/%s.tscn" % level_data.game_over_path_1
	var game_over_path_2 = "res://scenes/%s.tscn" % level_data.game_over_path_2
	var game_over_path_3 = "res://scenes/%s.tscn" % level_data.game_over_path_3

	var level_res_1 := load(level_path_1)
	var level_res_2 := load(level_path_2)
	var level_res_3 := load(level_path_3)
	
	var clear_1_res_1 := load(lvl1_1_star)
	var clear_1_res_2 := load(lvl1_2_star)
	var clear_1_res_3 := load(lvl1_3_star)
	
	var clear_2_res_1 := load(lvl2_1_star)
	
	var clear_3_res_1 := load(lvl3_1_star)
	
	var over_res_1 := load(game_over_path_1)
	var over_res_2 := load(game_over_path_2)
	var over_res_3 := load(game_over_path_3)

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

#Game Clear Level 1
	elif clear_1_res_1:
		loaded_clear_1_1 = clear_1_res_1.instantiate()
		get_tree().root.add_child(loaded_clear_1_1, false)
	elif clear_1_res_2:
		loaded_clear_1_2 = clear_1_res_2.instantiate()
		get_tree().root.add_child(loaded_clear_1_2, false)
	elif clear_1_res_3:
		loaded_clear_1_3 = clear_1_res_3.instantiate()
		get_tree().root.add_child(loaded_clear_1_3, false)

#Game Clear Level 2
	elif clear_2_res_1:
		loaded_clear_2_1 = clear_2_res_1.instantiate()
		get_tree().root.add_child(loaded_clear_2_1, false)


#Game Clear Level 3
	elif clear_3_res_1:
		loaded_clear_3_1 = clear_3_res_1.instantiate()
		get_tree().root.add_child(loaded_clear_3_1, false)


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
				print(" Level Path:", lvl.lvl1_1_star)
			else:
				print(" Level Path:", lvl.lvl2_1_star)
			level_to_return = lvl
			break
	return level_to_return
