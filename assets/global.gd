extends Node

var audio
var song = preload("res://import/audio/Mammuten - 06 - Refuge of Impiety.mp3")
export (int) var bpm = 186
onready var player = preload("res://assets/player/player.tscn")

var indoorsLightColor = Color(0.19, 0, 0.25)

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	audio = $AudioStreamPlayer
	audio.stream_paused = true


func _process(_delta):
	if Input.is_action_just_pressed("jump"):
		pass
