class_name  ToLevel3
extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if Global.total_trash == 30: #100%
			Global.reset_trash()
			LevelManager.load_level(14) # 3 Star
		elif Global.total_trash <= 24 && Global.total_trash >= 20: #80%
			Global.reset_trash()
			LevelManager.load_level(13) # 2 Star
		elif Global.total_trash <= 21 && Global.total_trash >= 0: #70%
			Global.reset_trash()
			LevelManager.load_level(5) # 1 Star
