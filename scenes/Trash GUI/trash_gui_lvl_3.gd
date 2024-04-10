class_name TrashGuiLvl3
extends CanvasLayer

var total_trash = 0

func _process(delta):
	$Label.text = "Trash Collected: " + str(Global.total_trash) + "/40"
	$Label.modulate = Color(0, 0, 0, 1)
