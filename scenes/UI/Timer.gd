extends Control


func _ready():
	Reset_Timer()
	pass # Replace with function body.


var seconds = 0
var minutes = 0
var Dseconds = 30
var Dminutes = 1



func _on_timer_timeout():
	if seconds ==0:
		if minutes>0:
			minutes-=1
			seconds=60
	seconds-=1
	
	$Label.text=str(minutes)+":"+str(seconds)
	pass # Replace with function body.


func Reset_Timer():
	seconds=Dseconds
	minutes=Dminutes
