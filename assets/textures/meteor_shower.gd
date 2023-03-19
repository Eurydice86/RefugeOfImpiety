extends Node2D

onready var meteor = preload("res://assets/textures/meteor.tscn")
export var meteorsN = 1
export var size = 1.0
export var speed = 1000.0
export var time = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass
	
func _on_Timer_timeout():
	yield(get_tree().create_timer(time), "timeout")
	var posX = randi() % (1080+1920)
	var posY = 0
	var m = meteor.instance()
	m.init(Vector2(posX, posY), speed, time + time*rand_range(0, 2*time), size)
	add_child(m)	

	$Timer.start()
