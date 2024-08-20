extends Control


var day_progress := 0.0
var passing_rate := 0.0
var last_rate := 0.0


func _ready():
	EventCentre.manual_pause.connect(manual_pause)
	EventCentre.manual_unpause.connect(manual_unpause)


func _process(delta):
	day_progress += delta / 5 * passing_rate
	if day_progress > 1:
		next_day()


func next_day() -> void:
	day_progress -= 1
	StatManager.next_day()


func manual_pause() -> void:
	last_rate = passing_rate
	$Button.button_pressed = true
	


func manual_unpause() -> void:
	match last_rate:
		1.0:
			$Button2.button_pressed = true
		2.0:
			$Button3.button_pressed = true
		5.0:
			$Button4.button_pressed = true


func pause(on):
	if on:
		passing_rate = 0
		$Button2.special_unpress()
		$Button2.mouse_filter = Control.MOUSE_FILTER_STOP
		$Button3.special_unpress()
		$Button3.mouse_filter = Control.MOUSE_FILTER_STOP
		$Button4.special_unpress()
		$Button4.mouse_filter = Control.MOUSE_FILTER_STOP
		EventCentre.paused.emit()
		$Button.mouse_filter = MOUSE_FILTER_IGNORE


func run(toggled_on, new_rate : float):
	var activated_button : TextureButton
	match new_rate:
		1.0:
			activated_button = $Button2
		2.0:
			activated_button = $Button3
		5.0:
			activated_button = $Button4
	
	if toggled_on:
		$Button.special_unpress()
		$Button.mouse_filter = Control.MOUSE_FILTER_STOP
		
		if activated_button != $Button2:
			$Button2.special_unpress()
			$Button2.mouse_filter = Control.MOUSE_FILTER_STOP
		if activated_button != $Button3:
			$Button3.special_unpress()
			$Button3.mouse_filter = Control.MOUSE_FILTER_STOP
		if activated_button != $Button4:
			$Button4.special_unpress()
			$Button4.mouse_filter = Control.MOUSE_FILTER_STOP
		
		activated_button.mouse_filter = Control.MOUSE_FILTER_IGNORE
		
		if passing_rate == 0:
			passing_rate = new_rate
			EventCentre.started_again.emit()
		else:
			passing_rate = new_rate

