extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#print(Global.player)
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_flyPoint_body_entered(body):
	if body.name[0] == "p":
		var pos = body.position
		body.queue_free()
		var eagleInstance = Global.eagle.instance()
		eagleInstance.position = pos
		get_parent().add_child(eagleInstance)
