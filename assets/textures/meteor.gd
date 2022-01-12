extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var velocity = Vector2(0,0)
var rotationSpeed
export var offset = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.visible = false
	$AnimatedSprite.stop()
	rotationSpeed = 2*PI*randf() - PI
	$Sprite.visible = false
	if offset == -1:
		offset = randi()%600 - 300
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	$Sprite.position += velocity * 3 * delta
	$Sprite.rotation_degrees += rotationSpeed*delta
	if velocity.length() > 0:
		velocity += Vector2(0,100*delta)
	pass


func _on_trigger_body_entered(body):
	if body.name == "player":
		var wantedHeight = 500
		# pick a random angle between -45 and 45 degrees (zero is the y-axis)
		var theta = randf()*PI/2 - PI/4
		var y = -cos(theta)
		var scaling = -wantedHeight / y
		y = scaling * y
		var x = scaling * sin(theta)
		var updatedPosition = Vector2(x,y)
		$Sprite.position = updatedPosition
		$Sprite.visible = true
		velocity = Vector2(offset,0) - updatedPosition



func _on_trigger_mouse_entered():
	var wantedHeight = 500
	# pick a random angle between -45 and 45 degrees (zero is the y-axis)
	var theta = randf()*PI/2 - PI/4
	var y = -cos(theta)
	var scaling = -wantedHeight / y
	y = scaling * y
	var x = scaling * sin(theta)
	var updatedPosition = Vector2(x,y)
	$Sprite.position = updatedPosition
	$Sprite.visible = true
	velocity = Vector2(offset,0) - updatedPosition
	
	$Line2D.add_point(Vector2(0,0))
	$Line2D.add_point(updatedPosition)


func _on_Area2D_body_entered(body):
	$Sprite.visible = false
	$AnimatedSprite.position = Vector2(offset,0)
	$AnimatedSprite.visible = true
	$AnimatedSprite.set_frame(0)
	$AnimatedSprite.play()


func _on_AnimatedSprite_animation_finished():
	queue_free()