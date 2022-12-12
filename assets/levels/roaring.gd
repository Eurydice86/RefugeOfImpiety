extends Node2D

var bpm = Global.bpm
export var start = 146.8

var alpha = 1
var alphaChange = false
var alphaSpeed = 3.0

# Called when the node enters the scene tree for the first time.
func _ready():
	################################################
	################################################
	################ MOVE THE PLAYER ONE TILE FORWARD
	################################################
	################################################
	# remove the next two lines for the overall scene
	#Global.audio.play()
	#Global.audio.seek(start)
	#Global.audio.stream_paused = false
	$ColorRect.visible = true
	$ColorRect.color = Color(1,1,1,alpha)

func _process(delta):
	if alphaChange:
		if alpha > 0:
			alpha -= delta*alphaSpeed
	$ColorRect.color = Color(1,1,1,alpha)


func _on_Timer_timeout():
	alphaChange = true
