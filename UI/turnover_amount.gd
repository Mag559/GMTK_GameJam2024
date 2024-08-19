extends Label


func _process(delta):
	text = "turnover: " + str(round(StatManager.turnover))


