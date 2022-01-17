extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var point
var maxSize

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	maxSize = 100 / get_parent().speed
	width = 5/get_parent().speed
	point = get_parent().pos
	add_point(point)
	if points.size() >maxSize:
		remove_point(0)
