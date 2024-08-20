extends TextureRect


func _ready():
	EventCentre.show_project_visual.connect(show_project_visual)

func show_project_visual(index : int) -> void:
	match index:
		1:
			visible = true
