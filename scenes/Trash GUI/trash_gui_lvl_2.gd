class_name TrashGuiLvl2
extends CanvasLayer

var total_trash = 0

func _process(delta):
	$Label.text = "Trash Collected: " + str(Global.total_trash) + "/30"
	$Label.modulate = Color(0, 0, 0, 1)
