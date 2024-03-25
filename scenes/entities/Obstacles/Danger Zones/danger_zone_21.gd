extends Area2D


#Signal for body entering this area
func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Player died!")
		body.call("DZ21")
