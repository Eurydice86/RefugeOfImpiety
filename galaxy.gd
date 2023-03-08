extends Node2D

var scl_x
var scl_y
var rot

var scaleMin = 0.25
var scaleMax = 2.5

var sprites = [
	"res://import/images/Aether/quasar.png",
	"res://import/images/Aether/galaxy1.png",
	"res://import/images/Aether/galaxy2.png",
	"res://import/images/Aether/galaxy3.png"]

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Sprite.set_modulate(Color(randf(),randf(),randf()))
	scl_x = (scaleMax - scaleMin) * randf() + scaleMin
	scl_y = 1.25 * randf() + 0.5
	rot = 2 * PI * randf()
	
	var celestialBody = randi() % len(sprites)
	if celestialBody == 0:
		scl_y = scl_x
	$Sprite.texture = load(sprites[celestialBody])
	$Sprite2.texture = load(sprites[celestialBody])
	$Sprite.scale = Vector2(scl_x, scl_y)
	$Sprite2.scale = Vector2(scl_x, scl_y)*1.02
	$Sprite.rotation = rot
	$Sprite2.rotation = rot


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
