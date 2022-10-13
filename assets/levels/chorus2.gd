extends Node2D


var alpha = 0.0
var alphaChange = false
var aplhaSpeed = 2.3

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

func _on_change_scene_body_entered(_body):
	get_tree().change_scene("res://Part3.tscn")

func _on_flashStart_body_entered(body):
	if body.name == "player":
		alphaChange = true
