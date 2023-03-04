extends Node2D

var bpm = Global.bpm
export var start = 344.9
onready var spaceshipDefaultPosition = $spaceship.position
var player
var shake = false
export var trauma = 0.6

var smokeScaling = false
export var smoke1_scale_speed : float = 1.0022
export var smoke2_scale_speed : float = 1.002
export var smoke3_scale_speed : float = 1.0018
export var smoke4_scale_speed : float = 1.0017
export var smoke5_scale_speed : float = 1.0021
export var smoke6_scale_speed : float = 1.0019

# Called when the node enters the scene tree for the first time.
func _ready():
#	Global.audio.seek(start)
#	Global.audio.stream_paused = false
	pass

func _physics_process(_delta):
	if shake:
		player.get_node("Camera2D").trauma = trauma
	if smokeScaling:
		$spaceship/Smoke/Smoke1.scale *= smoke1_scale_speed * Vector2(1, 1)
		$spaceship/Smoke/Smoke2.scale *= smoke2_scale_speed * Vector2(1, 1)
		$spaceship/Smoke/Smoke3.scale *= smoke3_scale_speed * Vector2(1, 1)
		$spaceship/Smoke/Smoke4.scale *= smoke4_scale_speed * Vector2(1, 1)
		$spaceship/Smoke/Smoke5.scale *= smoke3_scale_speed * Vector2(1, 1)
		$spaceship/Smoke/Smoke6.scale *= smoke4_scale_speed * Vector2(1, 1)
		
func _on_stop_moving_body_entered(body):
	if body.name == "player":
		player = body
		body.visible = false
		$AnimationPlayer.play("retract bridge")
		$doorTimer.start()
		body.walking = false
		body.running = false
		body.zoomOut = true
		smokeScaling = true


func _on_start_walking_body_entered(body):
	if body.name == "player":
		body.walking = true
		body.running = false


func _on_doorTimer_timeout():
	$spaceship/doorSprite.play("door_close")
	$spaceship/CaveEntrance.z_index = -1


func _on_AnimationPlayer_animation_finished(retract_bridge):
	start_spaceship()

func start_spaceship():
	shake = true
