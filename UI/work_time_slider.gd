extends HSlider

func _on_value_changed(value):
	StatManager.work_time = value
