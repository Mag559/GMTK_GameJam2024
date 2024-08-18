extends Label

func _process(delta):
	text = "their wages cost: " + str(StatManager.get_daily_wages_cost())
