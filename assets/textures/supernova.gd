extends Node2D

var velocity = Vector2(0,0)
var v

export var image = "res://import/images/Aether/supernova_NK2.png"

func _ready():
	$expand.texture = load(image)
	v = 100
	$explosion.visible = false
	$expand.visible = false

func _on_Area2D_body_entered(body):
	if body.name == "player":
		$AnimationPlayer.play("implosion")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "implosion":
		$initial.visible = false
		$explosion.visible = true
		$AnimationPlayer.play("explosion")
	elif anim_name == "explosion":
		$explosion.visible = false
		$expand.visible = true
		$AnimationPlayer.play("expand")

func _physics_process(delta):
	$initial.position += velocity * delta
	$explosion.position += velocity * delta
	$expand.position += velocity * delta


func _on_start_moving_body_entered(body):
	if body.name == "player":
		velocity = Vector2(v,0)
