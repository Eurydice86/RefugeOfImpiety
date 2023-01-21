extends RigidBody2D




# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		set_gravity_scale(4)
