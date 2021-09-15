extends Particles2D

<<<<<<< Updated upstream
=======

>>>>>>> Stashed changes
export (Resource) var image

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = image
<<<<<<< Updated upstream
	print(get_material().shader)
=======

>>>>>>> Stashed changes

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_explodingArea2D_body_entered(body):
	if body.name[0] == "p":
		$Sprite.visible = false
		set_emitting(true)

func _on_explodingArea2D_body_exited(body):
	pass
