extends Label
var current_value := 0
var newest_value := 0

@export var displayed_value_from_StatManager : String
@export var describtion_text : String

var tween : Tween

func _process(_delta):
	text = describtion_text + str(current_value)
	if newest_value == round(StatManager.get(displayed_value_from_StatManager)):
		return
	newest_value = round(StatManager.get(displayed_value_from_StatManager))
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_ease(Tween.EASE_OUT)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "current_value", newest_value, 1.0)
