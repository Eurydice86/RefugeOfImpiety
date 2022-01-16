extends Camera2D

var trauma = 0.0
var decay = 0.9999
var trauma_power = 3

var max_roll = 0.1
var max_offset = Vector2(20, 20)


func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)

func _process(delta):
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()

func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * rand_range(-1, 1)
	offset.x = 300 + max_offset.x * amount * rand_range(-1, 1)
	offset.y = -50 + max_offset.y * amount * rand_range(-1, 1)
	
