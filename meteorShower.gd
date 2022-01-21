extends Node2D

var mtr = preload("res://assets/textures/meteorLine.tscn")
#var mtr = preload("res://assets/textures/Meteorite.tscn")

var meteors = []
export var amount = 10
export var maxSpeed = 500

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
		if m.position.y > 1300:
			meteors.erase(m)

