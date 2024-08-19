extends Label


func _process(delta):
	text = "work time: " + str(StatManager.work_time)
