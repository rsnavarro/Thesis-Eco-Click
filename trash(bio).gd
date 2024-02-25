extends Area2D

var is_collected = false

func _on_body_entered(body):
	if not is_collected:
		is_collected = true
		Global.total_trash += 1
		$AudioStreamPlayer2D.play()
		hide()
