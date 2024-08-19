extends Label

func _process(delta):
	text = "Income/day: " + str(round(StatManager.get_daily_income()))
