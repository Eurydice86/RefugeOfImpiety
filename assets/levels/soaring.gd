extends Node2D

var bpm = Global.bpm
export var start = 90

var changeAlpha = false
var alpha = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#remove the next 6 lines for the overall scene
	
#	$eagle.set_physics_process(true)
#	$eagle/Camera2D.current = true
#	$eagle.direction = Vector2(1, -1).normalized()
#	$eagle.speed = 1000

#	Global.audio.seek(start)
#	Global.audio.stream_paused = false
	$ColorRect.visible = true
	$ColorRect.color = Color(1, 1, 1, alpha)
	
	
func _process(delta):
	
#	To export the mountain in real size, Add a Camera2D with zoom(30,30),
#	uncomment the following lines and resize the exported png my 3000%
#	without any antialiasing in IrfanView

#	var img = get_viewport().get_texture().get_data()
#	img.flip_y()
#	yield(VisualServer, "frame_post_draw")
#	img.save_png("D:\\print.png")

	if changeAlpha:
		if alpha <=1:
			alpha += delta
	$ColorRect.color = Color(1, 1, 1, alpha)


func _on_zoomOut_body_entered(body):
	body.zooming = -1

func _on_zoomIn_body_entered(body):
	body.zooming = 1


func _on_flashStart_body_entered(body):
	if body.name == "eagle":
		changeAlpha = true


func _on_changeScene_body_entered(body):
	if body.name == "eagle":
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Part2.tscn")
