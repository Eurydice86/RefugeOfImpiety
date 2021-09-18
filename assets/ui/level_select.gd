extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_intro_pressed():
	get_tree().change_scene("res://assets/levels/intro.tscn")

func _on_verse1_pressed():
	get_tree().change_scene("res://assets/levels/verse1.tscn")

func _on_chorus1_pressed():
	get_tree().change_scene("res://assets/levels/chorus1.tscn")

func _on_verse2_pressed():
	get_tree().change_scene("res://assets/levels/verse2.tscn")

func _on_soaring_pressed():
	get_tree().change_scene("res://assets/levels/soaring.tscn")

func _on_chorus2_pressed():
	get_tree().change_scene("res://assets/levels/chorus2.tscn")

func _on_bridge2_pressed():
	get_tree().change_scene("res://assets/levels/bridge2.tscn")

func _on_bridge1_pressed():
	get_tree().change_scene("res://assets/levels/bridge1.tscn")

func _on_solo_pressed():
	get_tree().change_scene("res://assets/levels/solo.tscn")

func _on_roaring_pressed():
	get_tree().change_scene("res://assets/levels/roaring.tscn")
	
func _on_outroSlow_pressed():
	get_tree().change_scene("res://assets/levels/outro_slow.tscn")

func _on_outroFast_pressed():
	get_tree().change_scene("res://assets/levels/outro_fast.tscn")

func _on_tragos_pressed():
	get_tree().change_scene("res://assets/levels/tragos.tscn")
