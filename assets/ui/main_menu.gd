extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()

func _on_levelSelect_pressed():
	get_tree().change_scene("res://assets/ui/level_select.tscn")
