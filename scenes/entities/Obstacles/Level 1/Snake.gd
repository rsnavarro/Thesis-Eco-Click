extends CharacterBody2D

const SPEED = 25.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_alive = true
@onready var animated_sprite_2d = $AnimatedSprite2D

#@onready var ray_cast_2d_left = $Wall_Checks/RayCast2D_Left as RayCast2D
#@onready var ray_cast_2d_right = $Wall_Checks/RayCast2D_Right as RayCast2D
#@onready var floor_ray_cast_left = $Floor_Checks/Floor_RayCast_Left as RayCast2D
#@onready var floor_ray_cast_right = $Floor_Checks/Floor_RayCast_Right as RayCast2D

#@export var wander_speed : float = 40.0
#@export var chase_speed : float = 80.0

#var current_speed : float = 0.0
#var player_found : bool = false


#enum States{
	#Wander,
	#Chase
#}

#var current_state = States.Wander	

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x = SPEED

	move_and_slide()

func _on_body_entered(body):
	if body is Player:
		print("Player collided with enemy")
		body.call("on_death4")

func _on_snake_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		is_alive = false
		queue_free()
