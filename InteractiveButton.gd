extends TextureButton


@export var normal_modulate := Color.WHITE * 0.95
@export var hover_modulate := Color.WHITE * 1.1
@export var pressed_modulate := Color.WHITE * 0.85
@export var disabled_modulate := Color.WHITE * 0.6

var mouse_in := false
var tween : Tween
var anim_time := 0.2


func _on_mouse_entered():
	mouse_in = true
	if not (button_pressed or disabled):
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", hover_modulate, anim_time)


func _on_mouse_exited():
	mouse_in = false
	if not (button_pressed or disabled):
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", normal_modulate, anim_time)


func _on_button_down():
	if tween:
			tween.kill()
	tween = create_tween()
	tween.tween_property(self, "modulate", pressed_modulate, anim_time)


func _on_button_up():
	if button_pressed: # for toggle buttons
		return
	elif mouse_in:
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", hover_modulate, anim_time)
	else:
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", hover_modulate, anim_time)


func update_based_on_disabled() -> void:
	if disabled:
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", disabled_modulate, anim_time)
	elif button_pressed:
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", pressed_modulate, anim_time)
	elif mouse_in:
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", hover_modulate, anim_time)
	else:
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "modulate", normal_modulate, anim_time)


func special_unpress() -> void:
	if tween:
			tween.kill()
	tween = create_tween()
	tween.tween_property(self, "modulate", normal_modulate, anim_time)
	button_pressed = false
