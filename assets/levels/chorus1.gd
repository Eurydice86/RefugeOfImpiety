extends Node2D

var bpm = Global.bpm
export var start = 73.42
var eagle

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.audio.seek(start)
	Global.audio.stream_paused = false


func _on_stop_body_entered(body):
	if body.name == "player":
		body.walking = false
		body.running = false

func _on_start_eagle_body_entered(body):
	if body.name == "player":
		$eagle.set_physics_process(true)
