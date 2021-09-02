extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var stateMachine
# Called when the node enters the scene tree for the first time.
func _ready():
	stateMachine = $AnimationTree.get("parameters/playback")
	stateMachine.start("off")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_torch_body_entered(body):
	print(body.name)
	if body.name[0] == "p":
		stateMachine.travel("on")
