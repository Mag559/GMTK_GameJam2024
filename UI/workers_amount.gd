extends Label


func _process(delta):
	text = "amount of employees: " + str(StatManager.employees)
