extends Node2D

onready var meteor = load("res://assets/textures/meteor.tscn")
export var meteorsN = 10
export var xRange = (1920 + 1080)/2
export var scaleFactor = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if get_child_count() < meteorsN:
		var posX = randi()%1920 - 480
		var posY = -800
		var m = meteor.instance()
		m.init(Vector2(posX, posY), scaleFactor)
		add_child(m)
