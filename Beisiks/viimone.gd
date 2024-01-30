extends Control

var menyy = preload("res://Beisiks/valid_main_menu.tscn")

func _input(_event):
	if Input.is_action_just_pressed("key_esc"):
		var s = menyy.instantiate()
		get_parent().add_child(s) #add new scene at a higher parent hierarchy
		queue_free() #leave and refuse to elaborate
