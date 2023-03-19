extends Node2D

export var start = 0.0

onready var appearingText = preload("res://assets/ui/appearingText.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
