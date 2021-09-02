extends Node2D

var bpm = Global.bpm
export var start = 52.1
#export var start = 61.7


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.audio.seek(start)
	Global.audio.stream_paused = false
