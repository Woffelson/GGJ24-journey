extends Control

@export var peli : Resource
@export var tekstii : Resource
@export_multiline var txt

var softat = null

func _ready():
	$MarginContainer/VBoxContainer/start.grab_focus()
#	$MarginContainer/VBoxContainer/start.connect("pressed",Callable(self,"_on_start_pressed"))
#	$MarginContainer/VBoxContainer/scredits.connect("pressed",Callable(self,"_on_scredits_pressed"))
#	$MarginContainer/VBoxContainer/quit.connect("pressed",Callable(self,"_on_quit_pressed"))

func _on_start_pressed():
	#get_tree().unload_current_scene()
	#get_tree().change_scene_to_packed(peli)
	var p = Global.peli.instantiate()
	get_tree().root.add_child(p)
	queue_free()

func _on_scredits_pressed():
	if softat == null:
		var tex = tekstii.instantiate()
		add_child(tex)
		tex.teksti.text = txt
		softat = tex
	else: softat.queue_free()

func _on_quit_pressed():
	get_tree().quit()
