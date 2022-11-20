extends Node2D

var bpm = Global.bpm
export var start = 344.9



# Called when the node enters the scene tree for the first time.
func _ready():
#	Global.audio.seek(start)
#	Global.audio.stream_paused = false
	pass

func _physics_process(_delta):
	pass

func _on_stop_moving_body_entered(body):
	if body.name == "player":
		$spaceship/doorSprite.play("door_close")
		$spaceship/doorSprite.z_index = 1
		body.walking = false
		body.running = false
		body.zoomOut = true


func _on_start_walking_body_entered(body):
	if body.name == "player":
		body.walking = true
		body.running = false
