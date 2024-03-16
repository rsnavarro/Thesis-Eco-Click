class_name MainMenu
extends Control
@onready var menu = $Background/MarginContainer/Menu
@onready var settings = $Settings
@onready var video = $Video
@onready var audio = $Audio
@onready var Master_Vol = AudioServer.get_bus_index("Master")
@onready var Music_Vol = AudioServer.get_bus_index("Music")
@onready var SFX_Vol = AudioServer.get_bus_index("Sound FX")

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
	show_and_hide(menu, settings)


func _on_fullscreen_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_back_video_pressed():
	show_and_hide(settings, video)


func _on_master_value_changed(value):
	AudioServer.set_bus_volume_db(Master_Vol, linear_to_db(value))
	AudioServer.set_bus_mute(Master_Vol, value < .05)
	
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index, value)

func _on_music_value_changed(value):
	AudioServer.set_bus_volume_db(Music_Vol, linear_to_db(value))
	AudioServer.set_bus_mute(Music_Vol, value < .05)


func _on_sound_fx_value_changed(value):
	AudioServer.set_bus_volume_db(Music_Vol, linear_to_db(value))
	AudioServer.set_bus_mute(SFX_Vol, value < .05)


func _on_back_audio_pressed():
	show_and_hide(settings, audio)
