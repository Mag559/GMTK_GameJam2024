extends Label

func _process(delta):
	text = "current money: " + str(StatManager.money)
