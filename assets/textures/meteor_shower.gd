extends Node2D

onready var meteor = load("res://assets/textures/meteor.tscn")
export var meteorsN = 1.0
export var size = 1.0
export var speed = 1000.0
export var time = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if get_child_count() < meteorsN:
		var posX = randi() % (1080+1920)
		var posY = -randi() % 200
		var m = meteor.instance()
		m.init(Vector2(posX, posY), speed, time + time*rand_range(0, 2 *  time), size)
		add_child(m)
