extends Label


var current_value1 := 0
var newest_value1 := 0
var current_value2 := 0
var newest_value2 := 0

var tween : Tween
var tween2 : Tween

func _process(_delta):
	text = "surpass " + str(current_value1) + "\nturnover by day " + str(current_value2)
	if newest_value1 == round(StatManager.get_required_turnover()):
		return
	newest_value1 = round(StatManager.get_required_turnover())
	newest_value2 = round(StatManager.turnover_cycle * 20)
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "current_value1", newest_value1, 1.0)
	if tween2:
		tween2.kill()
	tween2 = create_tween()
	tween2.set_ease(Tween.EASE_OUT)
	tween2.set_trans(Tween.TRANS_SINE)
	tween2.tween_property(self, "current_value2", newest_value2, 1.0)
