extends HSlider



func _on_value_changed(value):
	StatManager.wage_per_hour = value
