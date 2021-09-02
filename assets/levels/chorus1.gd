extends Node2D

var bpm = Global.bpm
export var start = 73
var eagle
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.audio.seek(start)
	Global.audio.stream_paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_stop_body_entered(body):
	if body.name[0] == "p":
		body.walking = false
		body.running = false


func _on_start_eagle_body_entered(body):
	if body.name[0] == "p":
		# replace the next line with the six alternative lines for the full scene
		$eagle.speed = 1000
		
		
#		var children = get_parent().get_children()
#		var egl
#		for i in range(len(children)):
#			if children[i].name[0] == "e":
#				egl = children[i]
#		egl.speed = 1000
