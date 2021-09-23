extends Node2D

var bpm = Global.bpm
export var start = 109.1
var alpha = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	
		# remove the next two lines for a change from soaring to this
	#Global.audio.seek(start)
	#Global.audio.stream_paused = false
	$ColorRect.visible = true
	$ColorRect.color = Color(1, 1, 1, alpha)

func _process(delta):
	$ColorRect.color = Color(1, 1, 1, alpha)
	if alpha >= 0:
		alpha -=  delta



func _on_earthEntered_body_entered(body):
	print(body.name)
	if body.name == "player":
		$earthEntered/foreverTimer.start()
		$earthEntered/onThisTimer.start()
		$earthEntered/toxicEarthTimer.start()


func _on_foreverTimer_timeout():
	$static_text/Forever.visible = true


func _on_onThisTimer_timeout():
		$static_text/on_this.visible = true


func _on_toxicEarthTimer_timeout():
		$static_text/toxic.visible = true
		$static_text/Earth.visible = true
