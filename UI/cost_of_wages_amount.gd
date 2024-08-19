extends Label

func _process(delta):
	text = "Total Wage: " + str(StatManager.get_daily_wages_cost())
