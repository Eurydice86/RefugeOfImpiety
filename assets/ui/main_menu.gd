extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Start_button_up():
	get_tree().change_scene("res://Part1.tscn")


func _on_Quit_pressed():
	get_tree().quit()
