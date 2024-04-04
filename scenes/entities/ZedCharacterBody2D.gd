class_name Player
extends CharacterBody2D

@export var speed : float = 275.0
@export var jump_force : float = -300.0
@export var jump_time : float = 0.25
@export var coyote_time : float = 0.075
@export var gravity_multiplier : float = 3.0
@export var double_jump_force : float = -350.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var can_double_jump : bool = false
var double_jump_timer : float = 0.0
var num_jumps : int = 0
var can_control : bool = true
var invincibility_time = 1.0

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
@onready var pause_menu = $Camera2D/PauseMenu


func _ready():
	add_to_group("Player")

func _physics_process(delta):
	if not can_control: return
	
	# Gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_force
			num_jumps = 1
			can_double_jump = true
		elif can_double_jump and num_jumps < 2:
			velocity.y = double_jump_force
			num_jumps += 1
			can_double_jump = false
			double_jump_timer = 0.0

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	#Flip the sprite to face the direction it is moving
	if direction != 0:
		sprite_2d.flip_h = direction < 0
	
	handle_animations(direction)
	move_and_slide()

func handle_animations(direction : float) -> void:
	if abs(direction) > 0.1 and is_on_floor():
		animation_player.play("Running")
	elif not is_on_floor():
		animation_player.play("Jumping")
	else:
		animation_player.play("Idle")


var paused = false
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		PauseMenu()
	if not is_on_floor():
		double_jump_timer += delta
		if double_jump_timer > coyote_time:
			can_double_jump = true

func PauseMenu():
	if paused:
		AudioPlayer.play()
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		AudioPlayer.stop()
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused



func turn_visible():
	visible = true
	can_control = true

func _on_body_hitbox_body_entered(body):
#Obstacles
	if body.is_in_group("Dynamite"):
		on_death1()
	elif body.is_in_group("Crab"):
		on_death2()
	elif body.is_in_group("Seagull"):
		on_death3()
	elif body.is_in_group("Snake"):
		on_death4()
	elif body.is_in_group("Turtle"):
		on_death5()
	elif body.is_in_group("Jellyfish"):
		on_death6()
	elif body.is_in_group("Giant Clam"):
		on_death7()
	elif body.is_in_group("Angler Fish"):
		on_death8()
	elif body.is_in_group("Quicksand Pit"):
		on_death9()
	elif body.is_in_group("Rapid Plant"):
		on_death10()
	elif body.is_in_group("Iguana"):
		on_death11()
	elif body.is_in_group("Albatross"):
		on_death12()
	elif body.is_in_group("Monkey"):
		on_death13()

#Danger Zones Level 1
	elif body.is_in_group("DZ1"):
		DZ1()
	elif body.is_in_group("DZ2"):
		DZ2()
	elif body.is_in_group("DZ3"):
		DZ3()
	elif body.is_in_group("DZ4"):
		DZ4()
	elif body.is_in_group("DZ5"):
		DZ5()
	elif body.is_in_group("DZ6"):
		DZ6()
	elif body.is_in_group("DZ7"):
		DZ7()
	elif body.is_in_group("DZ8"):
		DZ8()
	elif body.is_in_group("DZ9"):
		DZ9()
	elif body.is_in_group("DZ10"):
		DZ10()
	elif body.is_in_group("DZ11"):
		DZ11()
	elif body.is_in_group("DZ12"):
		DZ12()

#Danger Zones Level 2
	elif body.is_in_group("DZ13"):
		DZ13()
	elif body.is_in_group("DZ14"):
		DZ14()
	elif body.is_in_group("DZ15"):
		DZ15()
	elif body.is_in_group("DZ16"):
		DZ16()
	elif body.is_in_group("DZ17"):
		DZ17()
	elif body.is_in_group("DZ18"):
		DZ18()
	elif body.is_in_group("DZ19"):
		DZ19()
	elif body.is_in_group("DZ20"):
		DZ20()
	elif body.is_in_group("DZ21"):
		DZ21()
	elif body.is_in_group("DZ22"):
		DZ22()
	elif body.is_in_group("DZ23"):
		DZ23()
	elif body.is_in_group("DZ24"):
		DZ24()
	elif body.is_in_group("DZ25"):
		DZ25()
	elif body.is_in_group("DZ26"):
		DZ26()

#Danger Zones Level 3
	elif body.is_in_group("DZ27"):
		DZ27()
	elif body.is_in_group("DZ28"):
		DZ28()
	elif body.is_in_group("DZ29"):
		DZ29()
	elif body.is_in_group("DZ30"):
		DZ30()
	elif body.is_in_group("DZ31"):
		DZ31()
	elif body.is_in_group("DZ32"):
		DZ32()
	elif body.is_in_group("DZ33"):
		DZ33()
	elif body.is_in_group("DZ34"):
		DZ34()
	elif body.is_in_group("DZ35"):
		DZ35()
	elif body.is_in_group("DZ36"):
		DZ36()
	elif body.is_in_group("DZ37"):
		DZ37()
	elif body.is_in_group("DZ38"):
		DZ38()
	elif body.is_in_group("DZ39"):
		DZ39()
	elif body.is_in_group("DZ40"):
		DZ40()
	elif body.is_in_group("DZ41"):
		DZ41()
	elif body.is_in_group("DZ42"):
		DZ42()
	elif body.is_in_group("DZ43"):
		DZ43()
	elif body.is_in_group("DZ44"):
		DZ44()
	elif body.is_in_group("DZ45"):
		DZ45()
	elif body.is_in_group("DZ46"):
		DZ46()
	elif body.is_in_group("DZ47"):
		DZ47()
	elif body.is_in_group("DZ48"):
		DZ48()
	elif body.is_in_group("DZ49"):
		DZ49()
	elif body.is_in_group("DZ50"):
		DZ50()

#Spawn points of Obstacles
#Level 1 Obstacles
func on_death1(): #Dynamite
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.spawnpoint_1.global_position
	turn_visible()

func on_death2(): #Crab
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.spawnpoint_2.global_position
	turn_visible()

func on_death3(): #Seagull
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.spawnpoint_3.global_position
	turn_visible()

func on_death4(): #Snake
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.spawnpoint_4.global_position
	turn_visible()

#Level 2 Obstacles
func on_death5(): #Turtle
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

func on_death6(): #Jellyfish
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

func on_death7(): #Giant Clam
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

func on_death8(): #Angler Fish
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

#Level 3 Obstacles
func on_death9(): #Quicksand Pit
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

func on_death10(): #Rapid Plant
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

func on_death11(): #Iguana
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

func on_death12(): #Albatross
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

func on_death13(): #Monkey
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	#global_position = LevelManager.loaded_level.spawnpoint_5.global_position
	turn_visible()

#Danger Zones Level 1
func DZ1():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S1.global_position
	turn_visible()

func DZ2():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S2.global_position
	turn_visible()

func DZ3():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S3.global_position
	turn_visible()

func DZ4():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S4.global_position
	turn_visible()

func DZ5():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S5.global_position
	turn_visible()

func DZ6():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S6.global_position
	turn_visible()

func DZ7():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S7.global_position
	turn_visible()

func DZ8():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S8.global_position
	turn_visible()

func DZ9():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S9.global_position
	turn_visible()

func DZ10():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S10.global_position
	turn_visible()

func DZ11():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S11.global_position
	turn_visible()

func DZ12():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_1.DZ_S12.global_position
	turn_visible()

#Danger Zones Level 2
func DZ13():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S13.global_position
	turn_visible()

func DZ14():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S14.global_position
	turn_visible()

func DZ15():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S15.global_position
	turn_visible()

func DZ16():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S16.global_position
	turn_visible()

func DZ17():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S17.global_position
	turn_visible()

func DZ18():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S18.global_position
	turn_visible()

func DZ19():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S19.global_position
	turn_visible()

func DZ20():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S20.global_position
	turn_visible()

func DZ21():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S21.global_position
	turn_visible()

func DZ22():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S22.global_position
	turn_visible()

func DZ23():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S23.global_position
	turn_visible()

func DZ24():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S24.global_position
	turn_visible()

func DZ25():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S25.global_position
	turn_visible()

func DZ26():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_2.DZ_S26.global_position
	turn_visible()

#Danger Zones Level 3
func DZ27():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S27.global_position
	turn_visible()

func DZ28():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S28.global_position
	turn_visible()

func DZ29():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S29.global_position
	turn_visible()

func DZ30():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S30.global_position
	turn_visible()

func DZ31():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S31.global_position
	turn_visible()

func DZ32():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S32.global_position
	turn_visible()

func DZ33():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S33.global_position
	turn_visible()

func DZ34():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S34.global_position
	turn_visible()

func DZ35():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S35.global_position
	turn_visible()

func DZ36():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S36.global_position
	turn_visible()

func DZ37():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S37.global_position
	turn_visible()

func DZ38():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S38.global_position
	turn_visible()

func DZ39():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S39.global_position
	turn_visible()

func DZ40():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S40.global_position
	turn_visible()

func DZ41():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S41.global_position
	turn_visible()

func DZ42():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S42.global_position
	turn_visible()

func DZ43():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S43.global_position
	turn_visible()

func DZ44():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S44.global_position
	turn_visible()

func DZ45():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S45.global_position
	turn_visible()

func DZ46():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S46.global_position
	turn_visible()

func DZ47():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S47.global_position
	turn_visible()

func DZ48():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S48.global_position
	turn_visible()

func DZ49():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S49.global_position
	turn_visible()

func DZ50():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level_3.DZ_S50.global_position
	turn_visible()

var master_bus = AudioServer.get_bus_index("Master")

func _on_texture_button_pressed():
	AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))
