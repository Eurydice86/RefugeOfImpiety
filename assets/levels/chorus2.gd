extends Node2D

var bpm = Global.bpm
export var start = 129.5

var alpha = 0.0
var alphaChange = false
var aplhaSpeed = 2.2

# Called when the node enters the scene tree for the first time.
func _ready():
	#Global.audio.seek(start)
	#Global.audio.stream_paused = false
	$cRect/ColorRect.color = Color(1, 1, 1, alpha)
	$cRect/ColorRect.visible = true
	pass

func _process(delta):
	if alphaChange:
		if alpha < 1:
			alpha += delta * aplhaSpeed
	$cRect/ColorRect.color = Color(1, 1, 1, alpha)

func _on_change_scene_body_entered(body):
	get_tree().change_scene("res://Node2D part 3.tscn")

func _on_flashStart_body_entered(body):
	alphaChange = true
