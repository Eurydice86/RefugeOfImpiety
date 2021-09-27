extends Node2D

export (int) var bpm = 186
export var start = 232.6
var alpha = 0
var alphaDecay = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
#	Global.audio.seek(start)
#	Global.audio.stream_paused = false
	$CanvasModulate.visible = false
	$ground.visible = false

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasModulate.color = Global.indoorsLightColor

func _on_startRunning_body_entered(body):
	if body.name == "player":
		body.walking = false
		body.running = true
		$CanvasModulate.visible = false
		$ColorRect2.queue_free()
		


func _on_stop_moving_body_entered(body):
	body.walking = false
	body.running = false
	$ground.visible = true
	$ColorRect2.visible = true
	$CanvasModulate.visible = true
	alpha = 1
	
	yield(get_tree().create_timer(10.08),"timeout")
	body.walking = true
	$ColorRect2.visible = true


func _on_lightningStrike_body_entered(body):
	alpha = 1
	alphaDecay = 0.9
