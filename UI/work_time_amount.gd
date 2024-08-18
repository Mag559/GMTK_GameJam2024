extends Label


func _process(delta):
	text = "working this many hours: " + str(StatManager.work_time)
