extends Node2D

var bpm = Global.bpm
export var start = 345



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.audio.seek(start)
	Global.audio.stream_paused = false


func _on_stop_moving_body_entered(body):
	if body.name == "player":
		body.walking = false
		body.running = false