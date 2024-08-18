extends Label

func _process(delta):
	text = "at this hourly wage: " + str(StatManager.wage_per_hour)
