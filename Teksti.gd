extends "res://teksti_base.gd"

func _ready():
	teksti.text = "Moikkelismoi"
	reset_write(teksti)

func _input(_event):
	if Input.is_action_just_pressed("key_z") && !writing: queue_free()

func _on_typewrite_timeout():
	abs_write(teksti)
