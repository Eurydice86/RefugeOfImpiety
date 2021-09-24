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
	$ground.visible = false

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasModulate.color = Global.indoorsLightColor
	if blur:
		$WorldEnvironment.environment.dof_blur_near_amount = 0.2 * randf()
	else:
		$WorldEnvironment.environment.dof_blur_near_amount = 0
	if alpha > 0:
		alpha -= alphaDecay * delta
	$ColorRect.color = Color(1,1,1,alpha)

func _on_Timer_timeout(body):
	pass


func _on_startRunning_body_entered(body):
	if body.name == "player":
		body.walking = false
		body.running = true
		blur = false
		$WorldEnvironment.environment.dof_blur_near_amount = 0
		$CanvasModulate.visible = false
		


func _on_stop_moving_body_entered(body):
	body.walking = false
	body.running = false
	#$stop_moving/Timer.start(body)
	blur = true
	$ground.visible = true
	$ColorRect.visible = true
	$ColorRect2.visible = true
	$CanvasModulate.visible = true
	alpha = 1
	
	yield(get_tree().create_timer(10.2),"timeout")
	body.walking = true
	$ColorRect2.visible = true


func _on_lightningStrike_body_entered(body):
	alpha = 1
	alphaDecay = 0.9
