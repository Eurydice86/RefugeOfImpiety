extends Node

var cache_ := []
# Called when the node enters the scene tree for the first time.
func _ready():
	cache_.push_back(load("res://import/images/Wasteland/waste_mountain_bottom left.png"))
	cache_.push_back(load("res://import/images/Wasteland/waste_mountain_left_bottom.png"))
	cache_.push_back(load("res://import/images/Wasteland/waste_mountain_left_top.png"))
	cache_.push_back(load("res://import/images/Wasteland/waste_mountain_top.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
