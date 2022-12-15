extends Node

onready var audio = $AudioStreamPlayer
var song = preload("res://import/audio/Mammuten - 06 - Refuge of Impiety.mp3")
export (int) var bpm = 186
onready var player = preload("res://assets/player/player.tscn")

var indoorsLightColor = Color(0.19, 0, 0.25)

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.stream = song
	randomize()

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = !get_tree().paused
		$AudioStreamPlayer.stream_paused = get_tree().paused
