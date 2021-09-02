extends Area2D


export var targetX = 0
var speed = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name[0] == "p":
		pass #$KinematicBody2D.position.y = body.position.y - 50
