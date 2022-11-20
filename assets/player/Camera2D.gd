extends Camera2D

var trauma
var decay = 0.99
var trauma_power = 2

var max_roll = 0.5
var max_offset = Vector2(30, 20)


func add_trauma(amount):
	trauma = min(trauma + amount, 1.0)

func _process(delta):
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		shake()
	else:
		reset()

func shake():
	var amount = pow(trauma, trauma_power)
	rotation = max_roll * amount * rand_range(-1, 1)
	offset.x = max_offset.x * amount * rand_range(-1, 1)
	offset.y = max_offset.y * amount * rand_range(-1, 1)

func reset():
	offset = Vector2(0,0)

func perma_shake():
	var amount = 0.7
	rotation = max_roll * amount * rand_range(-1, 1)
	offset.x = max_offset.x * amount * rand_range(-1, 1)
	offset.y = max_offset.y * amount * rand_range(-1, 1)	
