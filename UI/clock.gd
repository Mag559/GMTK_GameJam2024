extends TextureRect


func _process(_delta):
	rotation = $"../../../../TimeControls2".day_progress * TAU
