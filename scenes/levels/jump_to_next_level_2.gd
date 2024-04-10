class_name  ToLevel2
extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if Global.total_trash == 20: #100%
			LevelManager.load_level(12) # 3 Star
			Global.reset_trash()
		elif Global.total_trash <= 16 && Global.total_trash >= 15: #80%
			LevelManager.load_level(11) # 2 Star
			Global.reset_trash()
		elif Global.total_trash <= 14 && Global.total_trash >= 0: #70
			LevelManager.load_level(4) # 1 Star
			Global.reset_trash()
