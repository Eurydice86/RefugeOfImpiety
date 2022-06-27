extends Node2D

export var start = 0.0

func _process(_delta):
	$WorldEnvironment.environment.dof_blur_near_amount = 0.15*randf()
