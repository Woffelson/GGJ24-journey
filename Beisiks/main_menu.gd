extends Control

@export var peli : Resource
@export var tekstii : Resource
@export_multiline var txt

func _on_start_pressed():
	get_tree().change_scene_to_packed(peli)

func _on_scredits_pressed():
	var tex = tekstii.instantiate()
	add_child(tex)
	tex.teksti.text = txt

func _on_quit_pressed():
	get_tree().quit()
