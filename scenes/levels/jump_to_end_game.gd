class_name  EndGame
extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if Global.total_trash >= 33 && Global.total_trash <= 40: #100%
			LevelManager.load_level(15) # 3 Star
		elif Global.total_trash <= 32 && Global.total_trash >= 29: #72% - 80%
			LevelManager.load_level(14) # 2 Star
		elif Global.total_trash <= 28 && Global.total_trash >= 24: #60% - 70%
			LevelManager.load_level(13) # 1 Star
		elif Global.total_trash <= 23 && Global.total_trash >= 0: #0% - 57%
			LevelManager.load_level(12) # 0 Star

