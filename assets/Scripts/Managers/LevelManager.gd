extends Node

var levels : Array[LevelData]
var main_scene : Node = null
var opening_scene_1 : Node = null
var loaded_level_1 : Level1 = null
var loaded_level_2 : Level2 = null
var loaded_level_3 : Level3 = null

var loaded_clear_1_0 : Lvl1Star0 = null
var loaded_clear_1_1 : Lvl1Star1 = null
var loaded_clear_1_2 : Lvl1Star2 = null
var loaded_clear_1_3 : Lvl1Star3 = null

var loaded_clear_2_0 : Lvl2Star0 = null
var loaded_clear_2_1 : Lvl2Star1 = null
var loaded_clear_2_2 : Lvl2Star2 = null
var loaded_clear_2_3 : Lvl2Star3 = null

var loaded_clear_3_0 : Lvl3Star0 = null
var loaded_clear_3_1 : Lvl3Star1 = null
var loaded_clear_3_2 : Lvl3Star2 = null
var loaded_clear_3_3 : Lvl3Star3 = null

var loaded_over_1 : GameOver1 = null
var loaded_over_2 : GameOver2 = null
var loaded_over_3 : GameOver3 = null

var loaded_opening_1 : Opening1 = null
var loaded_opening_2 : Opening2 = null
var loaded_opening_3 : Opening3 = null
var loaded_opening_4 : Opening4 = null

var loaded_ending_1 : Ending1 = null
var loaded_ending_2 : Ending2 = null
var loaded_ending_3 : Ending3 = null


func unload_level() -> void:
	if is_instance_valid(loaded_level_1):
		loaded_level_1.queue_free()
	elif is_instance_valid(loaded_level_2):
		loaded_level_2.queue_free()
	elif is_instance_valid(loaded_level_3):
		loaded_level_3.queue_free()

	elif is_instance_valid(loaded_clear_1_0):
		loaded_clear_1_0.queue_free()
	elif is_instance_valid(loaded_clear_1_1):
		loaded_clear_1_1.queue_free()
	elif is_instance_valid(loaded_clear_1_2):
		loaded_clear_1_2.queue_free()
	elif is_instance_valid(loaded_clear_1_3):
		loaded_clear_1_3.queue_free()

	elif is_instance_valid(loaded_clear_2_0):
		loaded_clear_2_0.queue_free()
	elif is_instance_valid(loaded_clear_2_1):
		loaded_clear_2_1.queue_free()
	elif is_instance_valid(loaded_clear_2_2):
		loaded_clear_2_2.queue_free()
	elif is_instance_valid(loaded_clear_2_3):
		loaded_clear_2_3.queue_free()

	elif is_instance_valid(loaded_clear_3_0):
		loaded_clear_3_0.queue_free()
	elif is_instance_valid(loaded_clear_3_1):
		loaded_clear_3_1.queue_free()
	elif is_instance_valid(loaded_clear_3_2):
		loaded_clear_3_2.queue_free()
	elif is_instance_valid(loaded_clear_3_3):
		loaded_clear_3_3.queue_free()

	elif is_instance_valid(loaded_over_1):
		loaded_over_1.queue_free()
	elif is_instance_valid(loaded_over_2):
		loaded_over_2.queue_free()
	elif is_instance_valid(loaded_over_3):
		loaded_over_3.queue_free()

	elif is_instance_valid(loaded_opening_1):
		loaded_opening_1.queue_free()
	elif is_instance_valid(loaded_opening_2):
		loaded_opening_2.queue_free()
	elif is_instance_valid(loaded_opening_3):
		loaded_opening_3.queue_free()
	elif is_instance_valid(loaded_opening_4):
		loaded_opening_4.queue_free()

	elif is_instance_valid(loaded_ending_1):
		loaded_ending_1.queue_free()
	elif is_instance_valid(loaded_ending_2):
		loaded_ending_2.queue_free()
	elif is_instance_valid(loaded_ending_3):
		loaded_ending_3.queue_free()

	loaded_level_1 = null
	loaded_level_2 = null
	loaded_level_3 = null

	loaded_clear_1_0 = null
	loaded_clear_1_1 = null
	loaded_clear_1_2 = null
	loaded_clear_1_3 = null

	loaded_clear_2_0 = null
	loaded_clear_2_1 = null
	loaded_clear_2_2 = null
	loaded_clear_2_3 = null

	loaded_clear_3_0 = null
	loaded_clear_3_1 = null
	loaded_clear_3_2 = null
	loaded_clear_3_3 = null

	loaded_over_1 = null
	loaded_over_2 = null
	loaded_over_3 = null

	loaded_opening_1 = null
	loaded_opening_2 = null
	loaded_opening_3 = null
	loaded_opening_4 = null

	loaded_ending_1 = null
	loaded_ending_2 = null
	loaded_ending_3 = null

func load_level(level_id : int) -> void:
	print("\nLoading Level: %s" % level_id)
	unload_level()
	
	var level_data = get_level_data_by_id(level_id)
	
	if not level_data:
		return
	
	var level_path_1 = "res://scenes/%s.tscn" % level_data.level_path_1
	var level_path_2 = "res://scenes/%s.tscn" % level_data.level_path_2
	var level_path_3 = "res://scenes/%s.tscn" % level_data.level_path_3

	var lvl1_0_star = "res://scenes/%s.tscn" % level_data.lvl1_0_star
	var lvl1_1_star = "res://scenes/%s.tscn" % level_data.lvl1_1_star
	var lvl1_2_star = "res://scenes/%s.tscn" % level_data.lvl1_2_star
	var lvl1_3_star = "res://scenes/%s.tscn" % level_data.lvl1_3_star

	var lvl2_0_star = "res://scenes/%s.tscn" % level_data.lvl2_0_star
	var lvl2_1_star = "res://scenes/%s.tscn" % level_data.lvl2_1_star
	var lvl2_2_star = "res://scenes/%s.tscn" % level_data.lvl2_2_star
	var lvl2_3_star = "res://scenes/%s.tscn" % level_data.lvl2_3_star

	var lvl3_0_star = "res://scenes/%s.tscn" % level_data.lvl3_0_star
	var lvl3_1_star = "res://scenes/%s.tscn" % level_data.lvl3_1_star
	var lvl3_2_star = "res://scenes/%s.tscn" % level_data.lvl3_2_star
	var lvl3_3_star = "res://scenes/%s.tscn" % level_data.lvl3_3_star
	
	var game_over_path_1 = "res://scenes/%s.tscn" % level_data.game_over_path_1
	var game_over_path_2 = "res://scenes/%s.tscn" % level_data.game_over_path_2
	var game_over_path_3 = "res://scenes/%s.tscn" % level_data.game_over_path_3

	var opening_1 = "res://scenes/%s.tscn" % level_data.opening_1
	var opening_2 = "res://scenes/%s.tscn" % level_data.opening_2
	var opening_3 = "res://scenes/%s.tscn" % level_data.opening_3
	var opening_4 = "res://scenes/%s.tscn" % level_data.opening_4

	var ending_1 = "res://scenes/%s.tscn" % level_data.ending_1
	var ending_2 = "res://scenes/%s.tscn" % level_data.ending_2
	var ending_3 = "res://scenes/%s.tscn" % level_data.ending_3

	var level_res_1 := load(level_path_1)
	var level_res_2 := load(level_path_2)
	var level_res_3 := load(level_path_3)

	var clear_1_res_0 := load(lvl1_0_star)
	var clear_1_res_1 := load(lvl1_1_star)
	var clear_1_res_2 := load(lvl1_2_star)
	var clear_1_res_3 := load(lvl1_3_star)

	var clear_2_res_0 := load(lvl2_0_star)
	var clear_2_res_1 := load(lvl2_1_star)
	var clear_2_res_2 := load(lvl2_2_star)
	var clear_2_res_3 := load(lvl2_3_star)

	var clear_3_res_0 := load(lvl3_0_star)
	var clear_3_res_1 := load(lvl3_1_star)
	var clear_3_res_2 := load(lvl3_2_star)
	var clear_3_res_3 := load(lvl3_3_star)
	
	var over_res_1 := load(game_over_path_1)
	var over_res_2 := load(game_over_path_2)
	var over_res_3 := load(game_over_path_3)

	var opening_res_1 := load(opening_1)
	var opening_res_2 := load(opening_2)
	var opening_res_3 := load(opening_3)
	var opening_res_4 := load(opening_4)

	var ending_res_1 := load(ending_1)
	var ending_res_2 := load(ending_2)
	var ending_res_3 := load(ending_3)

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
	elif clear_1_res_0:
		loaded_clear_1_0 = clear_1_res_0.instantiate()
		get_tree().root.add_child(loaded_clear_1_0, false)
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
	elif clear_2_res_0:
		loaded_clear_2_0 = clear_2_res_0.instantiate()
		get_tree().root.add_child(loaded_clear_2_0, false)
	elif clear_2_res_1:
		loaded_clear_2_1 = clear_2_res_1.instantiate()
		get_tree().root.add_child(loaded_clear_2_1, false)
	elif clear_2_res_2:
		loaded_clear_2_2 = clear_2_res_2.instantiate()
		get_tree().root.add_child(loaded_clear_2_2, false)
	elif clear_2_res_3:
		loaded_clear_2_3 = clear_2_res_3.instantiate()
		get_tree().root.add_child(loaded_clear_2_3, false)

#Game Clear Level 3
	elif clear_3_res_0:
		loaded_clear_3_0 = clear_3_res_0.instantiate()
		get_tree().root.add_child(loaded_clear_3_0, false)
	elif clear_3_res_1:
		loaded_clear_3_1 = clear_3_res_1.instantiate()
		get_tree().root.add_child(loaded_clear_3_1, false)
	elif clear_3_res_2:
		loaded_clear_3_2 = clear_3_res_2.instantiate()
		get_tree().root.add_child(loaded_clear_3_2, false)
	elif clear_3_res_3:
		loaded_clear_3_3 = clear_3_res_3.instantiate()
		get_tree().root.add_child(loaded_clear_3_3, false)

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

#Opening
	elif opening_res_1:
		loaded_opening_1 = opening_res_1.instantiate()
		get_tree().root.add_child(loaded_opening_1, false)
	elif opening_res_2:
		loaded_opening_2 = opening_res_2.instantiate()
		get_tree().root.add_child(loaded_opening_2, false)
	elif opening_res_3:
		loaded_opening_3 = opening_res_3.instantiate()
		get_tree().root.add_child(loaded_opening_3, false)
	elif opening_res_4:
		loaded_opening_4 = opening_res_4.instantiate()
		get_tree().root.add_child(loaded_opening_4, false)

#Ending
	elif ending_res_1:
		loaded_ending_1 = ending_res_1.instantiate()
		get_tree().root.add_child(loaded_ending_1, false)
	elif ending_res_2:
		loaded_ending_2 = ending_res_2.instantiate()
		get_tree().root.add_child(loaded_ending_2, false)
	elif ending_res_3:
		loaded_ending_3 = ending_res_3.instantiate()
		get_tree().root.add_child(loaded_ending_3, false)

	else:
		print("Level does not exist")


func get_level_data_by_id(id : int) -> LevelData:
	var level_to_return : LevelData = null
	
	for lvl : LevelData in levels:
		if lvl.level_id == id:
			print("\nFound Level Data:")
			print(" Level ID:", lvl.level_id)
			level_to_return = lvl
			break
	return level_to_return
