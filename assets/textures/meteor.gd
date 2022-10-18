extends KinematicBody2D

var velocity
export var rnd : bool = true
export var speed = 2000
export var speedMin = 1000
export var speedMax = 2000
var scaleFactor

var init_position

func init(pos, scaleF):
	init_position = pos
	scaleFactor = 0.1 * scaleF

# Called when the node enters the scene tree for the first time.
func _ready():
	position = init_position
	var scaleMult = randf()
	$AnimatedSprite.scale =  scaleFactor * scaleMult * Vector2(1, 1).normalized()
	$VisibilityEnabler2D.rect = Rect2( -524, 524, 1000, -1000)
	if rnd:
		speed = scaleFactor * (speedMin + randi() % (speedMax-speedMin))
	velocity = Vector2(-1, 1).normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(speed * delta * velocity)

func _draw():
	Rect2(-524, 524, 1000, -1000)

func _on_VisibilityEnabler2D_screen_exited():
	print("out")
	queue_free()
