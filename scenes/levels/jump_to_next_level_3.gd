class_name  ToLevel3
extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if Global.total_trash >= 25: #100%
			LevelManager.load_level(11) # 3 Star
		elif Global.total_trash <= 24 && Global.total_trash >= 22: #73% - 80%
			LevelManager.load_level(10) # 2 Star
		elif Global.total_trash <= 21 && Global.total_trash >= 18: #60% - 70%
			LevelManager.load_level(9) # 1 Star
		elif Global.total_trash <= 17 && Global.total_trash >= 0: #0% - 56%
			LevelManager.load_level(8) # 0 Star
