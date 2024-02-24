extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	hide() # Hide the panel initially

# Called when the button is pressed.
func _on_button_pressed():
	if is_visible():
		hide() # Hide the panel if it's already visible
	else:
		show() # Show the panel if it's hidden
