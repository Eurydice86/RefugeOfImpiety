extends KinematicBody2D

var runSpeed : float
export (int) var jumpSpeed = -512
export (float) var gravity = 1200
export (int) var tilesPerSec = 2

export var tileWidth = 64
export var tileHeight = 64

var direction = 1
var running
var walking

var velocity = Vector2()
var jumping = false

func _ready():
	running = true
	walking = false
	var bpm = get_parent().bpm
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
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("idle")
	else:
		if velocity.y >= 0 :
			$AnimatedSprite.play("fall")
		else:
			$AnimatedSprite.play("jump")

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))


func _on_Area2D_area_entered(area):
	if area.name[0] == "j" and is_on_floor():
		velocity.y = jumpSpeed
	elif area.name[0] == "c":
		Global.indoorsLightColor = pickRandomColor()
	elif area.name[0] == "d":
		direction *= -1
		$AnimatedSprite.flip_h = !$AnimatedSprite.flip_h

func _on_exit_pressed():
	get_tree().change_scene("res://assets/ui/main_menu.tscn")


func _on_pause_pressed():
	get_tree().paused = !get_tree().paused

func pickRandomColor():
	var r = randf()
	var g = randf()
	var b = randf()
	var norm = sqrt(r*r + g*g + b*b) * 5.0
	r /= norm
	b /= norm
	g /= norm
	return Color(r, g, b)
