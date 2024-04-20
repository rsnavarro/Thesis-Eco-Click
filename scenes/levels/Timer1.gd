class_name Timer1
extends Control

var max_time1 : float = 300.0
var time1 : float = max_time1
var minutes1 : int = 0
var seconds1 : int = 0


func _process(delta) -> void:
	time1 -= delta
	time1 = clamp(time1, 0, max_time1)
	seconds1 = fmod(time1, 60)
	minutes1 = fmod(time1, 3600) / 60
	$Minutes1.text = "%2d:" % minutes1
	$Seconds1.text = "%02d" % seconds1

	if time1 <= 0:
		_on_timer_1_timeout()

func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "%2d:%02d" % [minutes1, seconds1]

func update_display():
	seconds1 = fmod(time1, 60)
	minutes1 = fmod(time1, 3600) / 60
	$Minutes1.text = "%2d:" % minutes1
	$Seconds1.text = "%02d" % seconds1


func _on_timer_1_timeout():
	LevelManager.load_level(16)

func reset_timer():
	time1 = max_time1
