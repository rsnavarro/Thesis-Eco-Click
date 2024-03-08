extends Control

var max_time : float = 3.0
var time : float = max_time
var minutes : int = 0
var seconds : int = 0
#var game_over: bool = false
#signal game_over_signal
#var current_level_path = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta) -> void:
		
	time -= delta
	time = clamp(time, 0, max_time)
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%2d:" % minutes
	$Seconds.text = "%02d" % seconds

	if time <= 0:
		
		_on_game_over()
		#current_level_path = "res://scenes/levels/level_01.tscn"

func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "%2d:%02d" % [minutes, seconds]

func update_display():
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%2d:" % minutes
	$Seconds.text = "%02d" % seconds

func _on_game_over():
	#game_over = true
	#emit_signal("game_over_signal")
	get_tree().change_scene_to_file("res://scenes/UI/game_over.tscn")
	#var game_over_scene = preload("res://scenes/UI/game_over.tscn")
	#var game_over_instance = game_over_scene.instantiate()
	#get_tree().get_root().add_child(game_over_instance)
