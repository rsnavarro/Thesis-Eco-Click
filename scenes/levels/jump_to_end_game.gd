class_name  EndGame
extends Area2D


func _on_body_entered(body):
	if body.is_in_group("Player"):
		if Global.total_trash == 40: #100%
			Global.reset_trash()
			LevelManager.load_level(10) # 3 Star
		elif Global.total_trash <= 32  && Global.total_trash >= 27: #80%
			Global.reset_trash()
			 # 2 Star
		elif Global.total_trash <= 28  && Global.total_trash >= 0: #70%
			Global.reset_trash()
			 # 1 Star

