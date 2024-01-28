extends Control

var menyy = preload("res://Beisiks/valid_main_menu.tscn")

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		var s = menyy.instantiate()
		get_parent().add_child(s) #add new scene at a higher parent hierarchy
		queue_free() #leave and refuse to elaborate
