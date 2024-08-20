extends "res://InteractiveButton.gd"

var project_popup := preload("res://project_popup.tscn")
var last_popup

func _process(_delta):
	disabled = StatManager.projects_to_choose == 0
	update_based_on_disabled()


func _on_pressed():
	if is_instance_valid(last_popup):
		return
	last_popup = project_popup.instantiate()
	get_parent().add_child(last_popup)
