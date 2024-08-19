extends ColorRect


func _process(_delta):
	$ColorRect.anchor_top = 1 - (StatManager.reputation - StatManager.reputation_required_for_last_project) \
	 / (StatManager.get_reputation_for_new_project() - StatManager.reputation_required_for_last_project)
