extends Node2D

var bpm = Global.bpm
export var start = 344.9


var zoomOut = false
var zoomRate = 0.01

# Called when the node enters the scene tree for the first time.
func _ready():
#	Global.audio.seek(start)
#	Global.audio.stream_paused = false
	pass

func _process(delta):
	if zoomOut:
		if $player/Camera2D.zoom.x < 5:
			$player/Camera2D.zoom += Vector2(zoomRate,zoomRate)


func _on_stop_moving_body_entered(body):
	if body.name == "player":
		body.walking = false
		body.running = false
		zoomOut = true


func _on_start_walking_body_entered(body):
	if body.name == "player":
		body.walking = true
		body.running = false
