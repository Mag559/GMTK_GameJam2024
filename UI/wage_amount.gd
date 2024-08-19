extends Label

func _process(delta):
	text = "Wage/h: " + str(StatManager.wage_per_hour)
