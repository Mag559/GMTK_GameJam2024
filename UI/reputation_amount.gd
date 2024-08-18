extends Label



func _process(delta):
	text = "reputation: " + str(StatManager.reputation)
