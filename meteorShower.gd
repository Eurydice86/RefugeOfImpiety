extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mtr = preload("res://assets/textures/meteorLine.tscn")

var meteors = []
export var amount = 10
export var maxSpeed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if len(meteors) < amount:
		var newMtr = mtr.instance()
		add_child(newMtr)
		meteors.append(newMtr)
	for m in meteors:
		if m.pos.y > 1300:
			meteors.erase(m)

