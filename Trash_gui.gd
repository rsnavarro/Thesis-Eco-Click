extends CanvasLayer

func _process(delta):
	$Label.text = "Trash Collected: " + str(Global.total_trash)
	$Label.modulate = Color(0, 0, 0, 1) # Set text color to black
