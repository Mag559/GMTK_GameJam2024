extends Control


func _ready():
	EventCentre.show_project_visual.connect(show_project_visual)

func show_project_visual(index : int) -> void:
	match index:
		0:
			$TextureRect.visible = true
		1:
			pass
		2:
			$TextureRect3.visible = true
		3:
			pass
		4:
			pass
		5:
			$TextureRect2.visible = true
