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

#Danger Zones
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
	elif body.is_in_group("DZ13"):
		DZ13()


#Spawn points of Obstacles
#Level 1 Obstacles
func on_death1(): #Dynamite
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.spawnpoint_1.global_position
	turn_visible()

func on_death2(): #Crab
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.spawnpoint_2.global_position
	turn_visible()

func on_death3(): #Seagull
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.spawnpoint_3.global_position
	turn_visible()

func on_death4(): #Snake
	animation_player.play("Dead")
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.spawnpoint_4.global_position
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

#Danger Zones
func DZ1():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S1.global_position
	turn_visible()

func DZ2():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S2.global_position
	turn_visible()

func DZ3():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S3.global_position
	turn_visible()

func DZ4():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S4.global_position
	turn_visible()

func DZ5():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S5.global_position
	turn_visible()

func DZ6():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S6.global_position
	turn_visible()

func DZ7():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S7.global_position
	turn_visible()

func DZ8():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S8.global_position
	turn_visible()

func DZ9():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S9.global_position
	turn_visible()

func DZ10():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S10.global_position
	turn_visible()

func DZ11():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S11.global_position
	turn_visible()

func DZ12():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S12.global_position
	turn_visible()

func DZ13():
	visible = false
	can_control = false
	await get_tree().create_timer(1).timeout
	global_position = LevelManager.loaded_level.DZ_S13.global_position
	turn_visible()


var master_bus = AudioServer.get_bus_index("Master")

func _on_texture_button_pressed():
	AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))
