extends CanvasLayer


func _process(delta):
	$Label.text = "" + str(Global.total_trash) + "/40"
