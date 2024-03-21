extends AudioStreamPlayer

const level_music = preload("res://scenes/Audio/BG_Music.mp3")


func _play_music(music: AudioStream, volume = -20):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	stream.loop = true
	play()

func stop_music():
	AudioPlayer.stop()

func play_music_level():
	_play_music(level_music)
