extends Label

func _process(delta):
	text = "happiness: " + str(StatManager.get_happiness())
