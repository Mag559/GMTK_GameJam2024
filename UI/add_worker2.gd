extends "res://InteractiveButton.gd"


func _process(_delta):
	disabled = StatManager.money < StatManager.get_new_employee_cost()
	update_based_on_disabled()


func _on_pressed():
	StatManager.hire_new_employee()
