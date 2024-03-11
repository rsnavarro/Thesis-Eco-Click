extends Control

var max_time : float = 180.0
var time : float = max_time
var minutes : int = 0
var seconds : int = 0

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
		_on_game_over3()

func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "%2d:%02d" % [minutes, seconds]

func update_display():
	seconds = fmod(time, 60)
	minutes = fmod(time, 3600) / 60
	$Minutes.text = "%2d:" % minutes
	$Seconds.text = "%02d" % seconds

func _on_game_over3():
	get_tree().change_scene_to_file("res://scenes/UI/Game Over/game_over_3.tscn")
