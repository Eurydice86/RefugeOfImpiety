extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pos
var angle
var speed
var velocity
export var maxSpeed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(randi()%1920*2,-(randi() %200))
	angle = PI - PI/4 #* randf()
	speed = randf() * maxSpeed + 0.5
	velocity = speed * Vector2(cos(angle), sin(angle))
	if pos.y > 1300:
		queue_free()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos += velocity
	
