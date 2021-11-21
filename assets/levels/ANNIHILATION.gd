extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var appearing = false
var appearingSpeed = 0.6
# Called when the node enters the scene tree for the first time.
func _ready():
	percent_visible = 0.1


func _process(delta):
	if appearing:
		percent_visible += appearingSpeed * delta

func _on_Area2D_body_entered(body):
	if body.name == "player":
		appearing = true

