extends Sprite2D

var current_state = IDLE 

var is_chatting = false

var player
var player_in_chat_zone = false

enum {
	IDLE
}



func _process(delta):
	if Input.is_action_just_pressed("chat"):
		$DeemoDialogue.start()
		print("chatting with npc")
		is_chatting = true

func choose(array):
	array.shuffle()
	return array.front()

func _on_chat_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true


func _on_chat_detection_area_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false


func _on_timer_timeout():
	$Timer.wait_time = choose([0.5,1,1.5])
	current_state = choose([IDLE])




func _on_deemo_dialogue_dialogue_finished():
	is_chatting = false
	hide_dialogue()

func hide_dialogue():
	$DeemoDialogue.hide()

