extends Label



func _process(delta):
	text = "day: " + str(StatManager.days_passed)
