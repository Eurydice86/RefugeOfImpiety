extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var point
export var maxSize = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	maxSize = 100/get_parent().speed + 30
	width = get_parent().speed
	point = get_parent().pos
	add_point(point)
	if points.size() >maxSize:
		remove_point(0)
