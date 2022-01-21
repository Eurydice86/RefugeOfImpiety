extends Line2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var point
export var maxSize = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	clear_points()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	maxSize = 70/get_parent().speed + 30
	width = get_parent().speed / 5
	point = get_parent().pos
	add_point(point)
	if points.size() > maxSize:
		remove_point(0)
