extends ColorRect

var losing := false
var progress := 0.0

func _ready():
	EventCentre.loss.connect(on_loss)


func on_loss() -> void:
	losing = true


func _process(delta):
	if not losing:
		return
	progress += delta
	progress *= 1 + delta / 2
	material.set_shader_parameter("progress", progress)
