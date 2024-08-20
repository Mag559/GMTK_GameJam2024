extends TextureRect



var index := 0
@onready var label := $textBauble/Label
@onready var timer := $Timer

var queue := [
				"Welcome to <insert game title>",
				"You have been chosen as the CEO of this company",
				"Your goal is to hire new employees that in turn make you money",
				"Be warned however",
				"Happiness (that bar with a smiley face) has a very strong influence on the amount of money employees make IN BOLD",
				"increasing it via higher wages, shorter work time and projects is crutial for the complanies growth",
				"projects can be accessed by filling up the reputation bar (with a red arrow)",
				"one fillup correspondst to 1 project of you choosing",
				"while the are expensive, they provide enourmous boost to happiness or income",
				"got all of that? good",
				"see that turnover meter up there in the top left",
				"it measures how much money your employees have made (excluding any costs)",
				"now get to work and make that numer go all the way up",
				"or else someone else will take your position",
				]
var queue_going := true

func _ready():
	pass


func add_text_to_queue(text) -> void:
	queue.append(text)
	if not queue_going:
		$textBauble.visible = true
		queue_going = true
		_on_timer_timeout()
	
	
	
func _on_timer_timeout():
	if queue.size() == 0:
		queue_going = false
		$textBauble.visible = false
		return
	label.text = queue.pop_front()
	timer.start()
