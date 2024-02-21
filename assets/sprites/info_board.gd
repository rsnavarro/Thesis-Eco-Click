extends Area2D

var textbox
var label

func _ready():
	textbox = $Control
	label = textbox.get_node("Label")
	textbox.hide()

func _on_body_entered(body):
	label.text = "Hello, this is a dialogue box!"
	textbox.show()

func _on_body_exited(body):
	textbox.hide()
