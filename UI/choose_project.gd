extends Button

var project_popup := preload("res://project_popup.tscn")

func _process(delta):
	disabled = StatManager.projects_to_choose == 0


func _on_pressed():
	var popup := project_popup.instantiate()
	get_parent().add_child(popup)
