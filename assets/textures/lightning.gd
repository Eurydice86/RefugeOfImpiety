extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.playing = false
	$AnimatedSprite.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_lightning_body_entered(body):
	if body.name[0] == "p":
		$AnimatedSprite.play()
		$AnimatedSprite.visible = true


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.visible = false
