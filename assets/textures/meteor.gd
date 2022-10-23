extends KinematicBody2D

var velocity
export var rnd : bool = true
export var speed = 2000
export var speedMin = 1000
export var speedMax = 2000

var init_position
var init_speed
var init_time
var init_size

func init(pos, ispeed, itime, isize):
	init_speed = ispeed
	init_time = itime
	init_position = pos
	init_size = isize

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.play("default")
	$Timer.wait_time = init_time
	$Timer.start()
	global_position = init_position
	speed = init_speed
	velocity = Vector2(-1, 1).normalized()
	scale = Vector2(init_size,init_size)
	$Particles2D.amount = 800*init_size
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	move_and_collide(speed * delta * velocity)
	$Particles2D.process_material.set("scale", init_size)


func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	if body.name == "TileMap":
		explosion()

func explosion():
	$AnimatedSprite.play("explosion")
