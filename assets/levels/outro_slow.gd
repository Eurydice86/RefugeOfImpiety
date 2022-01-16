extends Node2D

export (int) var bpm = 186
export var start = 232.6
var alpha = 0
var alphaDecay = 0.1

export var stopTime = 10.28

# Called when the node enters the scene tree for the first time.
func _ready():
#	Global.audio.seek(start)
#	Global.audio.stream_paused = false
	$fadeIn.play("fadeIn")
	$CanvasModulate.visible = false

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasModulate.color = Global.indoorsLightColor

func _on_startRunning_body_entered(body):
	if body.name == "player":
		body.walking = false
		body.running = true
		$CanvasModulate.visible = false


func _on_stop_moving_body_entered(body):
	body.walking = false
	body.running = false
	$CanvasModulate.visible = true
	alpha = 1
	yield(get_tree().create_timer(stopTime),"timeout")
	body.walking = true


func _on_lightningStrike_body_entered(body):
	alpha = 1
	alphaDecay = 0.9
