extends Control

@export var peli : Resource
@export var tekstii : Resource
@export_multiline var txt

var softat = null

func _on_start_pressed():
	get_tree().change_scene_to_packed(peli)

func _on_scredits_pressed():
	if softat == null:
		var tex = tekstii.instantiate()
		add_child(tex)
		tex.teksti.text = txt
		softat = tex
	else: softat.queue_free()

func _on_quit_pressed():
	get_tree().quit()
