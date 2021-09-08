extends Node2D

var bpm = Global.bpm
export var start = 90

# Called when the node enters the scene tree for the first time.
func _ready():
	#remove the next two lines for the overall scene
	#$eagle.set_physics_process(true)
	#$eagle/Camera2D.current = true
	$eagle.direction = Vector2(1, -1).normalized()
	$eagle.speed = 1000
	Global.audio.seek(start)
	Global.audio.stream_paused = false


func _on_zoomOut_body_entered(body):
	body.zooming = -1

func _on_zoomIn_body_entered(body):
	body.zooming = 1
