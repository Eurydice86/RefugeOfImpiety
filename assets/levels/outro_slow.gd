extends Node2D

export (int) var bpm = 186
export var start = 232.6
var blur = false
var alpha = 0
var alphaDecay = 0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.audio.seek(start)
	Global.audio.stream_paused = false
	$CanvasModulate.visible = false

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasModulate.color = Global.indoorsLightColor
	if blur:
		$WorldEnvironment.environment.dof_blur_near_amount = 0.2 * randf()
	if alpha > 0:
		alpha -= alphaDecay * delta
	$ColorRect.color = Color(1,1,1,alpha)

func _on_Timer_timeout():
	$player.walking = true


func _on_startRunning_body_entered(body):
	if body.name[0] == "p":
		$player.walking = false
		$player.running = true
		blur = false
		$WorldEnvironment.environment.dof_blur_near_amount = 0
		$CanvasModulate.visible = false
		


func _on_stop_moving_body_entered(body):
	body.walking = false
	body.running = false
	$stop_moving/Timer.start()
	$CanvasModulate.visible = true
	blur = true
	$ground.visible = true
	$ColorRect.visible = true
	alpha = 1


func _on_lightningStrike_body_entered(body):
	alpha = 1
	alphaDecay = 0.9
