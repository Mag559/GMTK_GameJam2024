extends TextureRect



var index := 0
@onready var label := $textBauble/Label

var queue := [
				"Welcome to Scaling up, Boss!",
				"You have been chosen as the new CEO for this company since the last one was just sluggish.",
				"Your goal is to make money by hiring new employees.",
				"But that is not as simple as it sounds.",
				"Happiness (the left bar with a smiley face), has a very strong influence on the amount of money employees make.",
				"Increase it via higher wages, shorter work time, as well as adding projects, as it is crutial for the complanies growth.",
				"Projects can be accessed by filling up reputation (the right bar with a red arrow).",
				"By filling reputation up you can choose one project before needing to fill it up again.",
				"While projects are expensive, they provide enourmous boost to happiness and/or income.",
				"Got all of that?",
				"Good.",
				"See that turnover meter up to the left?",
				"That measures how much money your employees have made excluding any costs.",
				"Now get to work and make that number go all the way.",
				"Or else someone else will take your position if you do not meet requirements stated under it.",
				"Good Luck."
				]
var queue_going := true

func _ready():
	EventCentre.loss.connect(on_losing)
	_on_button_pressed()

func on_losing() -> void:
	$Button.visible = false
	$textBauble/Label.text = "I guess you are not the guy for this job"


func add_text_to_queue(text) -> void:
	queue.append(text)
	if not queue_going:
		$textBauble.visible = true
		$Button.visible = true
		queue_going = true
		_on_button_pressed()



func _on_button_pressed():
	if queue.size() == 0:
		queue_going = false
		$textBauble.visible = false
		$Button.visible = false
		return
	label.text = queue.pop_front()
