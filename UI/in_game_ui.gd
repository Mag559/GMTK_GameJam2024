extends CanvasLayer


func _ready():
	EventCentre.loss.connect(end)


func end() -> void:
	await get_tree().create_timer(8).timeout
	get_tree().quit()
	#var reset = load("res://UI/in_game_ui.tscn").instantiate()
	#get_tree().root.add_child(reset)
	#queue_free()
