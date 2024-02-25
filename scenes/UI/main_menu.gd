class_name MainMenu
extends Control
@onready var menu = $Background/MarginContainer/Menu
@onready var settings = $Settings
@onready var video = $Video
@onready var audio = $Audio





func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		toggle()
		
		
func toggle():
	visible = !visible
	get_tree().paused = visible



func _on_play_button_pressed():
	LevelManager.load_level(1)
	deactivate()

func _on_settings_button_pressed():
	show_and_hide(settings, menu)
	

func show_and_hide(first, second):
	first.show()
	second.hide()


func _on_quit_button_pressed():
	get_tree().quit()


func deactivate() -> void:
	hide()
	set_process(false)
	set_process_unhandled_input(false)
	set_process_input(false)


func activate() -> void:
	show()
	set_process(true)
	set_process_unhandled_input(true)
	set_process_input(true)


func _on_video_pressed():
	show_and_hide(video, settings)


func _on_audio_pressed():
	show_and_hide(audio, settings)


func _on_back_settings_pressed():
	show_and_hide(settings, menu)


func _on_fullscreen_toggled(toggled_on):
	OS.WINDOW_FULLSCREEN



func _on_borderless_toggled(toggled_on):
	OS.window_borderless = button_pressed


func _on_v_sync_toggled(toggled_on):
	pass # Replace with function body.
