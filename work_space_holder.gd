extends VBoxContainer


var work_space := preload("res://work_space.tscn")


func _ready():
	EventCentre.new_hire.connect(add_work_space)


func add_work_space() -> void:
	var new_work_space : TextureRect = work_space.instantiate()
	add_child(new_work_space)
	custom_minimum_size = Vector2(0, (StatManager.employees + 0.9) * owner.size.x / 1.85)
	move_child($TextureRect, get_child_count() - 1)
