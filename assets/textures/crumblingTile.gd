extends Particles2D


# Declare member variables here. Examples:
# var a = 2
func initialize(sprite: Texture):
	process_material.set_shader_param("emission_box_extents",Vector3(sprite.get_width() / 2.0, sprite.get_height() / 2.0,1))
	
	process_material.set_shader_param("sprite", sprite)
	
	amount - sprite.get_width() * sprite.get_height()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_crumblingArea2D_body_entered(body):
	if body.name[0] == "p":
		$Timer.start()
		set_emitting(true)
		$AnimationPlayer.play("fade")


func _on_Button_pressed():
	$Timer.start()
	set_emitting(true)
	$AnimationPlayer.play("fade")
