class_name Timer2
extends Control

var max_time2 : float = 240.0
var time2 : float = max_time2
var minutes2 : int = 0
var seconds2 : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta) -> void:
	time2 -= delta
	time2 = clamp(time2, 0, max_time2)
	seconds2 = fmod(time2, 60)
	minutes2 = fmod(time2, 3600) / 60
	$Minutes2.text = "%2d:" % minutes2
	$Seconds2.text = "%02d" % seconds2

	if time2 <= 0:
		_on_timer_2_timeout()


func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "%2d:%02d" % [minutes2, seconds2]

func update_display():
	seconds2 = fmod(time2, 60)
	minutes2 = fmod(time2, 3600) / 60
	$Minutes2.text = "%2d:" % minutes2
	$Seconds2.text = "%02d" % seconds2

func _on_timer_2_timeout():
		LevelManager.load_level(17)

func reset_timer():
	time2 = max_time2
