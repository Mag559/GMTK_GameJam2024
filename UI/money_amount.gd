extends Label

func _process(delta):
	text = "Money: " + str(StatManager.money)
