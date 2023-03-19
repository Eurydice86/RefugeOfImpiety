extends KinematicBody2D


# Declare member variables here. Examples:
var velocity = Vector2()
var direction = Vector2()
var forceStrength = 0
var forceDirection = direction
export var speed = 1000
var acceleration = 0

var gravity = 0

var currentZoom : float = 0.5
var zoomSpeed : float = 0.1
var minZoom : float = 0.5
var maxZoom : float = 2.0

var zooming = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(1,-1).normalized()
	visible = false
	set_physics_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	direction += forceStrength * forceDirection * delta
	direction = direction.normalized()
	speed += acceleration * delta
	velocity = direction * speed
	velocity = move_and_slide(velocity, Vector2(0, -1))
	$AnimatedSprite.rotation = velocity.normalized().angle()

	# zooming in or out
	if zooming == 1:
		if currentZoom < maxZoom:
			currentZoom += zoomSpeed * delta
	elif zooming == -1:
		if currentZoom > minZoom:
			currentZoom -= zoomSpeed * delta
	$Camera2D.zoom = Vector2(currentZoom, currentZoom)

func _on_Area2D_body_entered(body):
	if body.name[0] == "p":
		$Camera2D.current = true
		zooming = 1
		
	
func _on_pause_pressed():
	get_tree().paused = !get_tree().paused


func _on_Area2D_area_entered(area):
	if "Turn" in area.name:
		forceStrength = area.forceStrength
		forceDirection = area.forceDirection
	elif "dive" in area.name:
		$AnimatedSprite.play("soar")
		$Timer.start()


func _on_Timer_timeout():
	$AnimatedSprite.play("dive")
	acceleration = 1000
	zooming = -1
	zoomSpeed *= 3
