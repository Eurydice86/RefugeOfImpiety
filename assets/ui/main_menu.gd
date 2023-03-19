extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Start_button_up():
	get_tree().change_scene_to(Global.part1)


func _on_Quit_pressed():
	get_tree().quit()


func _on_Part2_pressed():
	get_tree().change_scene_to(Global.part2)


func _on_Part3_pressed():
	get_tree().change_scene_to(Global.part3)
