extends Node2D

var bpm = Global.bpm
export var start = 109
var alpha = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# remove the next two lines for a change from soaring to this
	# move player 7 tiles forward
	Global.audio.seek(start)
	Global.audio.stream_paused = false
	$ColorRect.color = Color(1, 1, 1, alpha)

func _process(delta):
	$ColorRect.color = Color(1, 1, 1, alpha)
	if alpha >= 0:
		alpha -=  delta

