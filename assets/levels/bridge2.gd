extends Node2D

var bpm = Global.bpm
export var start = 207.2
#export var start = 61.7


# Called when the node enters the scene tree for the first time.
func _ready():
	#Global.audio.seek(start)
	#Global.audio.stream_paused = false
	$colorRectNode/ColorRect.visible = true
	pass


func _on_change_scene_body_entered(body):
	if body.name == "player":
		get_tree().change_scene("res://Part4.tscn")



func _on_fadeOut_body_entered(body):
	$colorRectNode/ColorRect.visible = true
	$colorRectNode/AnimationPlayer.play("colorRectFadeOut")
	yield($colorRectNode/AnimationPlayer, "animation_finished")
	get_tree().change_scene("res://Part4.tscn")
