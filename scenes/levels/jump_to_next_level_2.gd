class_name  ToLevel2
extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if Global.total_trash >= 17: #100%
			LevelManager.load_level(7) # 3 Star
		elif Global.total_trash <= 16 && Global.total_trash >= 15: #75% - 80%
			LevelManager.load_level(6) # 2 Star
		elif Global.total_trash <= 14 && Global.total_trash >= 12: #60% - 70%
			LevelManager.load_level(5) # 1 Star
		elif Global.total_trash <= 11 && Global.total_trash >= 0: #0% - 55%
			LevelManager.load_level(4) # 0 Star
