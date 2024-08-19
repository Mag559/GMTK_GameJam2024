extends ColorRect


func _process(_delta):
	var bar_fillup := (StatManager.reputation - StatManager.reputation_required_for_last_project) \
	 	/ (StatManager.get_reputation_for_new_project() - StatManager.reputation_required_for_last_project)
	if bar_fillup >= 0:
		$ColorRect.anchor_top = 1 - bar_fillup
	else:
		$ColorRect.anchor_top = 1
