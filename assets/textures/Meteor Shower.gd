extends Particles2D

export var amt = 10
export var size = 1.0
export var speed = 100.0


func _ready():
	process_material.scale = size
	process_material.initial_velocity = speed
	amount = amt


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
