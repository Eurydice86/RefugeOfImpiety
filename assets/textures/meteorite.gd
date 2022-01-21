extends Node2D


export var collidable := false
export var maxSpeed := 1000

var speed
var velocity = Vector2(-1, 1).normalized()
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent():
		maxSpeed = get_parent().maxSpeed
	speed = rand_range(1,3) * maxSpeed
	$meteoriteSprite.scale = 0.15*Vector2(speed/maxSpeed, speed/maxSpeed)
	$meteoriteSprite/Particles2D.scale = Vector2(0.15*maxSpeed/speed, 0.15*maxSpeed/speed)
	position = Vector2(rand_range(500,1920),-200)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += speed * velocity * delta
	pass #position = get_global_mouse_position()
