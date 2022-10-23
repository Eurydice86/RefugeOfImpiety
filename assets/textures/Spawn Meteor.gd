extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var meteor = load("res://assets/textures/meteor.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Spawn_Meteor_body_entered(body):
	if body.name == "player":
		var offset = 0
		if rand_range(0,1) < 0.5:
			offset = 300
		if get_parent().onPoint == true:
			offset = 128
		var posX = global_position.x + 500 + offset
		var posY = global_position.y - 500
		var m = meteor.instance()
		m.init(Vector2(posX, posY), 2000, 1, 1)
		call_deferred("add_child", m)
