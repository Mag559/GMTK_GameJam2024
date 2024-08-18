extends Button




func _on_pressed():
	if StatManager.money > StatManager.get_new_employee_cost():
		StatManager.hire_new_employee()
