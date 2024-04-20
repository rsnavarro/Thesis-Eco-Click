class_name Timer3
extends Control

var max_time3 : float = 180.0
var time3 : float = max_time3
var minutes3 : int = 0
var seconds3 : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta) -> void:
	time3 -= delta
	time3 = clamp(time3, 0, max_time3)
	seconds3 = fmod(time3, 60)
	minutes3 = fmod(time3, 3600) / 60
	$Minutes3.text = "%2d:" % minutes3
	$Seconds3.text = "%02d" % seconds3

	if time3 <= 0:
		_on_timer_3_timeout()


func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "%2d:%02d" % [minutes3, seconds3]

func update_display():
	seconds3 = fmod(time3, 60)
	minutes3 = fmod(time3, 3600) / 60
	$Minutes3.text = "%2d:" % minutes3
	$Seconds3.text = "%02d" % seconds3

func _on_timer_3_timeout():
		LevelManager.load_level(18)

func reset_timer():
	time3 = max_time3
