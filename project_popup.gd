extends TextureRect

# name, cost, describtion
var projects := [["bus", 4000, "to add"],
				["table football", 2000, "to add"],
				["park", 15000, "to add"],
				["new laptops", 800000, "to add"],
				["windows", 2000, "to add"],
				["restaurant", 10000, "to add"],
]

var projects_to_choose_from := []
var already_chosen_projects := []

@onready var rng := RandomNumberGenerator.new()


func _ready():
	rng.seed = StatManager.run_seed * (StatManager.projects_earned - StatManager.projects_to_choose + 1)
	while projects_to_choose_from.size() < 3:
		var pick := rng.randi_range(0, projects.size() - 1)
		if not pick in projects_to_choose_from and not pick in already_chosen_projects:
			projects_to_choose_from.append(pick)
	$VBoxContainer/Label.text = "project name: " + projects[projects_to_choose_from[0]][0]
	$VBoxContainer/Label4.text = "cost: " + str(projects[projects_to_choose_from[0]][1])
	$VBoxContainer/Label7.text = "describtion: " + str(projects[projects_to_choose_from[0]][2])
	$VBoxContainer2/Label.text = "project name: " + projects[projects_to_choose_from[1]][0]
	$VBoxContainer2/Label4.text = "cost: " + str(projects[projects_to_choose_from[1]][1])
	$VBoxContainer2/Label7.text = "describtion: " + str(projects[projects_to_choose_from[1]][2])
	$VBoxContainer3/Label.text = "project name: " + projects[projects_to_choose_from[2]][0]
	$VBoxContainer3/Label4.text = "cost: " + str(projects[projects_to_choose_from[2]][1])
	$VBoxContainer3/Label7.text = "describtion: " + str(projects[projects_to_choose_from[2]][2])
	$Button2.disabled = StatManager.money < projects[projects_to_choose_from[0]][1]
	$Button2.update_based_on_disabled()
	$Button3.disabled = StatManager.money < projects[projects_to_choose_from[1]][1]
	$Button3.update_based_on_disabled()
	$Button4.disabled = StatManager.money < projects[projects_to_choose_from[2]][1]
	$Button4.update_based_on_disabled()
	
	
	EventCentre.manual_pause.emit()
	EventCentre.started_again.connect(go_away)



func _on_button_pressed():
	go_away()


func choose_project(project_index):
	var chosen_project : int = projects_to_choose_from[project_index]
	already_chosen_projects.append(chosen_project)
	StatManager.projects_to_choose -= 1
	StatManager.money -= projects[chosen_project][1]
	match chosen_project:
		0:
			StatManager.work_time_add_on += -1
		1:
			StatManager.effective_work_time_mult *= 0.85
			StatManager.happiness_mult *= 1.4
		2:
			StatManager.happiness_add_on += 1.0
		3:
			StatManager.income_exponent += 0.4
		4:
			StatManager.happiness_mult *= 1.2
		5:
			StatManager.effective_work_time_mult *= 0.9
			StatManager.happiness_add_on += 2.0
			
	EventCentre.emit_signal("show_project_visual", chosen_project)
	go_away()


func go_away() -> void:
	EventCentre.manual_unpause.emit()
	queue_free()
