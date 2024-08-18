extends Label

func _process(delta):
	text = "generate daily income totaling: " + str(StatManager.get_daily_income())
