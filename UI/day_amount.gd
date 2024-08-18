extends Label



func _process(delta):
	text = "days passed: " + str(StatManager.days_passed)
