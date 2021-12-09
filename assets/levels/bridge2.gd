extends Node2D

var bpm = Global.bpm
export var start = 207.2
#export var start = 61.7


# Called when the node enters the scene tree for the first time.
func _ready():
	#Global.audio.seek(start)
	#Global.audio.stream_paused = false
	pass


func _on_change_scene_body_entered(body):
	if body.name == "player":
		if get_tree().change_scene("res://Part4.tscn") != OK:
			print ("An unexpected error occured when trying to switch to the Readme scene")
		else:
			get_tree().change_scene("res://Part4.tscn")
