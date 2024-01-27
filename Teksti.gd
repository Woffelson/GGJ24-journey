extends "res://teksti_base.gd"

func _ready():
	teksti.text = "Moikkelismoi"
	reset_write(teksti)

func _on_typewrite_timeout():
	abs_write(teksti)
