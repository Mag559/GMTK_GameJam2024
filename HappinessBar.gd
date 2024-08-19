extends ColorRect

const POINT0 := 0.8
const log10 = log(10)
var gradient : GradientTexture1D = preload("res://happinessbar_gradient.tres")
@onready var gradient_image := gradient.get_image()


func _process(_delta):
	var happiness := StatManager.get_happiness()
	var mathy_value : float
	if happiness < 0:
		mathy_value = sin(-log(-happiness + 0.03) / log10) * 0.1 + 0.10057
	if happiness == 0:
		mathy_value = 1 - POINT0
	if happiness > 0:
		mathy_value = sin(log(happiness / 3.0 + 0.03) / log10) * 0.4 + 0.6
	
	$ColorRect.anchor_top = 1 - mathy_value
	$ColorRect.color = gradient_image.get_pixel(mathy_value * 256, 0)

