extends Control

#var current_level: int = 1

func _on_restart_pressed():
	get_tree().reload_current_scene()
	#reset_level()
	
	#var level_scene_path = "res://scenes/levels/level_" + str(current_level).pad_zeros(2) + ".tscn"
		# Check if the level scene path exists
	#if ResourceLoader.exists(level_scene_path):
		# Reload the level scene associated with the current level
		#get_tree().reload_current_scene()
	#else:
		# Log an error if the level scene path doesn't exist
		#printerr("Error: Level scene not found - " + level_scene_path)

func _on_quit_pressed():
	get_tree().quit()

#func reset_level():
	#match current_level:
		#1:
			# Reset logic for level 1
			#load_level_1()
		#2:
			# Reset logic for level 2
			#load_level_2()
		#3:
			# Reset logic for level 3
			#load_level_3()

#func load_level_1():
	#var character_body = get_node("res://scenes/entities/ZedCharacterBody2D.tscn")
	#if character_body:
		#character_body.reset_player()
	#print("Loading or resetting Level 1")

#func load_level_2():
	#get_node("ZedCharacterBody2D").global_transform.origin = Vector3(0, 0, 0)
	#print("Loading or resetting Level 2")

#func load_level_3():
	#get_node("ZedCharacterBody2D").global_transform.origin = Vector3(0, 0, 0)
	#print("Loading or resetting Level 3")
