extends Node2D

export var text = ""
export var fontSize = 100

var font = DynamicFont.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	font.font_data = load("res://import/fonts/Dark Mage.ttf")
	font.size = fontSize
	$Label.set("custom_fonts/font", font)
	$Label.visible = false
	$Label.text = text


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name[0] == "p":
		$Label.visible = true
