extends KinematicBody2D

var runSpeed : float
export (int) var jumpSpeed = -512
export (float) var gravity = 1200.0
export (int) var tilesPerSec = 2

export var tileWidth = 64
export var tileHeight = 64


var direction = 1
var running
var walking

var velocity = Vector2()
var jumping = false
export var targetCamPos = 100.0

var zoomOut = false
var zoomRate = 0.005

func _ready():
	running = true
	walking = false
	var bpm = Global.bpm
	var secondsPerBeat
	if bpm>0:
		secondsPerBeat = 60.0 / bpm
	else:
		secondsPerBeat = INF
	
	runSpeed = tilesPerSec * tileWidth / secondsPerBeat
	gravity = (2 * tileHeight / (secondsPerBeat * secondsPerBeat))
	gravity *= 1.2
	

func get_input():
	if running:
		velocity.x = direction * runSpeed
	elif walking:
		velocity.x = runSpeed/2
	else:
		velocity.x = 0

	if is_on_floor():
		if running:
			$AnimatedSprite.play("run")
		elif walking:
			$AnimatedSprite.play("walk")
		else:
			$AnimatedSprite.play("idle")
	else:
		if velocity.y >= 0:
			$AnimatedSprite.play("fall")
		else:
			$AnimatedSprite.play("jump")

func _physics_process(delta):
	$Camera2D.position.x = lerp($Camera2D.position.x, targetCamPos, 0.01)
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if zoomOut:
		zoom_out()

func _on_Area2D_area_entered(area):
	if "jumpPoint" in area.name and is_on_floor():
		velocity.y = jumpSpeed
	elif "camera_shake" in area.name:
		$Camera2D.trauma = area.trauma
	elif "changeLight" in area.name:
			Global.indoorsLightColor = pickRandomColor()
	elif "directionChange" in area.name:
		direction *= -1
		targetCamPos = -$Camera2D.position.x
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h

func pickRandomColor():
	var r = randf()
	var g = randf()
	var b = randf()
	var norm = sqrt(r*r + g*g + b*b) * 5.0
	r /= norm
	b /= norm
	g /= norm
	return Color(r, g, b)


func zoom_out():
	if $Camera2D.zoom.x < 3.0:
		$Camera2D.zoom += Vector2(zoomRate,zoomRate)
