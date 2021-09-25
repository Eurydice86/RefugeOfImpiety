extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	sleeping = true


func _on_Area2D_body_exited(body):
	if body.name[0] == "p":
		sleeping = false
