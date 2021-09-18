extends Node2D

var bpm = Global.bpm
export var start = 90

var changeAlpha = false
var alpha = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#remove the next two lines for the overall scene
	$eagle.set_physics_process(true)
	$eagle/Camera2D.current = true
	
	$eagle.direction = Vector2(1, -1).normalized()
	$eagle.speed = 1000
	Global.audio.seek(start)
	Global.audio.stream_paused = false
	$ColorRect.color = Color(1, 1, 1, alpha)
	
	
func _process(delta):
	if changeAlpha:
		if alpha <=1:
			alpha += delta
	$ColorRect.color = Color(1, 1, 1, alpha)


func _on_zoomOut_body_entered(body):
	body.zooming = -1

func _on_zoomIn_body_entered(body):
	body.zooming = 1


func _on_flashStart_body_entered(body):
	if body.name == "eagle":
		changeAlpha = true


func _on_changeScene_body_entered(body):
	if body.name == "eagle":
		get_tree().change_scene("res://assets/levels/verse2.tscn")
