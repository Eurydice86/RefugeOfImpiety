extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 0.5
var appear = false

# Called when the node enters the scene tree for the first time.
func _ready():
	percent_visible = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if appear:
		percent_visible += delta * speed


func _on_Area2D_body_entered(body):
	if body.name == "player":
		appear = true
