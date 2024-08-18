extends Node

var employees := 0
var work_time := 8.0
var work_time_add_on := 0.0
var effective_work_time_mult := 1.0
var reference_work_time := 8  # work time / reference_work_time in happiness equation
var wage_per_hour := 10.0
var reference_wage_per_hour := 10.0  # work time / reference_work_time in happiness equation
var income_multiplier := 12.0
var income_exponent := 1.0
var income_add_on := 0.0
var happiness_exp_base := 2.0  # for income calc
var happiness_mult := 1.0
var happiness_add_on := 0.0

var reputation := 0.0
var money := 2000.0
var turnover := 0.0
var days_passed := 0

var employee_cost_exponent := 3.0
var employee_cost_mult := 5.0
var employee_cost_add_on := 500.0

var projects_earned := 0
var projects_to_choose := 0
var reputation_required_exponential_base := 3.0
var reputation_required_add_on := 20.0


func get_daily_income() -> float:
	return employees * pow(work_time * effective_work_time_mult * income_multiplier
			* pow(happiness_exp_base, get_happiness())
			, income_exponent) \
			 + income_add_on


func get_daily_wages_cost() -> float:
	return work_time * wage_per_hour * employees


func get_happiness() -> float:  # can go negative
	return happiness_mult * (wage_per_hour / reference_wage_per_hour - (work_time + work_time_add_on) / reference_work_time)


func next_day() -> void:
	reputation += get_happiness()
	money += get_daily_income()
	money -= get_daily_wages_cost()
	turnover += get_daily_income()
	check_if_new_project()
	days_passed += 1
	

func get_new_employee_cost() -> float:
	return pow(employees, employee_cost_exponent) * employee_cost_mult + employee_cost_add_on


func hire_new_employee() -> void:
	money -= get_new_employee_cost()
	StatManager.employees += 1
	EventCentre.new_hire.emit()


func check_if_new_project() -> void:
	if reputation > get_reputation_for_new_project():
		projects_earned += 1
		projects_to_choose += 1


func get_reputation_for_new_project() -> float:
	return pow(reputation_required_exponential_base, projects_earned) + reputation_required_add_on
