extends Node2D

export (int) var bpm = 186
export var start = 232.6

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.audio.seek(start)
	Global.audio.stream_paused = false
	$CanvasModulate.visible = false

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$CanvasModulate.color = Global.indoorsLightColor

func _on_Timer_timeout():
	$player.walking = true


func _on_startRunning_body_entered(body):
	if body.name[0] == "p":
		$player.walking = false
		$player.running = true
		$CanvasModulate.visible = false


func _on_stop_moving_body_entered(body):
	body.walking = false
	body.running = false
	$stop_moving/Timer.start()
	$CanvasModulate.visible = true
