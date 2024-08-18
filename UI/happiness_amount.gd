extends Label

func _process(delta):
	text = "with a happiness: " + str(StatManager.get_happiness())
