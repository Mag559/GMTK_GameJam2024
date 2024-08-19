extends Label

func _process(delta):
	text = "Income/day: " + str(StatManager.get_daily_income())
