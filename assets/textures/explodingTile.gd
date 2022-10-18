extends Particles2D

export (Resource) var image
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = image
	process_material.set_shader_param("sprite", image)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_explodingArea2D_body_entered(body):
	if body.name == "player":
		$Sprite.visible = false
		set_emitting(true)
