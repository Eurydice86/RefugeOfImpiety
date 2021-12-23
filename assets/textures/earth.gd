extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
export var rotatingSpeed = 100
var bpm = 0

var modulateColour
var alpha = 1
var alphaSpeed = 0.5
var runSpeed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.rotation_degrees -= rotatingSpeed * delta
	$Sprite2.rotation_degrees -= rotatingSpeed * delta
	if modulateColour:
		if alpha > 0.25:
			alpha -= alphaSpeed * delta
			$Sprite.modulate = (Color(1,1,1,alpha))



func _on_runInPlace_body_entered(body):
	if body.name[0] == "p":
		body.running = true
		runSpeed = body.runSpeed
		body.runSpeed = 0
		modulateColour = true
		$runInPlace/Timer.start()
		


func _on_Timer_timeout():
	var bodies = $runInPlace.get_overlapping_bodies()
	var player = bodies[0]
	player.runSpeed = runSpeed
	player.velocity.y = player.jumpSpeed
