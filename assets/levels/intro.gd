extends Node2D

var bpm = Global.bpm
export var start = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_Area2D_body_entered(body):
	if "player" in body.name:
		Global.audio.play()

