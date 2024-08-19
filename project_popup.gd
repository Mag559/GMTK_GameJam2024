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
	rng.seed = StatManager.run_seed * (StatManager.projects_earned - StatManager.projects_to_choose)
	while projects_to_choose_from.size() < 3:
		var pick := rng.randi_range(0, projects.size() - 1)
		if not pick in projects_to_choose_from and not pick in already_chosen_projects:
			projects_to_choose_from.append(pick)
	$Label.text = "project name: " + projects[projects_to_choose_from[0]][0]
	$Label4.text = "cost: " + str(projects[projects_to_choose_from[0]][1])
	$Label2.text = "project name: " + projects[projects_to_choose_from[1]][0]
	$Label5.text = "cost: " + str(projects[projects_to_choose_from[1]][1])
	$Label3.text = "project name: " + projects[projects_to_choose_from[2]][0]
	$Label6.text = "cost: " + str(projects[projects_to_choose_from[2]][1])
	$Button2.disabled = StatManager.money < projects[projects_to_choose_from[0]][1]
	$Button3.disabled = StatManager.money < projects[projects_to_choose_from[1]][1]
	$Button4.disabled = StatManager.money < projects[projects_to_choose_from[2]][1]
	
	
	EventCentre.manual_pause.emit()
	EventCentre.started_again.connect(queue_free)



func _on_button_pressed():
	queue_free()


func choose_project(project_index):
	var chosen_project : int = projects_to_choose_from[project_index]
	already_chosen_projects.append(chosen_project)
	StatManager.projects_to_choose -= 1
	match chosen_project:
		0:
			StatManager.work_time_add_on += -1
		1:
			StatManager.effective_work_time_mult *= 0.85
			StatManager.happiness_mult *= 1.4
		3:
			StatManager.happiness_add_on += 1.0
		4:
			StatManager.income_exponent += 0.4
		5:
			StatManager.happiness_mult *= 1.2
		6:
			StatManager.effective_work_time_mult *= 0.9
			StatManager.happiness_add_on += 2.0
	
	queue_free()
