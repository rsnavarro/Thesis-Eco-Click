extends Control

var seconds = 0
var minutes = 0
var Dseconds = 0
var Dminutes = 5

func _ready():
	Reset_Timer()
	pass # Replace with function body.

func _on_timer_timeout():
	if seconds == 0:
		if minutes > 0:
			minutes -= 1
			seconds = 60

	seconds -= 1

	if minutes < 0: # Prevent negative minutes
		minutes = 0

	if seconds < 0: # Prevent negative seconds
		seconds = 0

	$Label.text = str(minutes) + ":" + str(seconds)
	pass # Replace with function body.

func Reset_Timer():
	seconds = Dseconds
	minutes = Dminutes
