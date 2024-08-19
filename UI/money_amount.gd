extends Label

func _process(delta):
	text = "Money: " + str(round(StatManager.money))
