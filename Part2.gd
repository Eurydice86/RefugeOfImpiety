extends Node2D

var bpm = Global.bpm
export var start = 109.6

func _ready():
	Global.audio.play()
	Global.audio.seek(start)
	Global.audio.stream_paused = false
	pass

func _process(_delta):
	$WorldEnvironment.environment.dof_blur_near_amount = 0.15*randf()
