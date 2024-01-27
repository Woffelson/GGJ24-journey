extends Node2D

@onready var lorez = get_node("Lores")

func _ready():
	for lore in lorez.get_children():
		lore.connect("loretime",Callable(self,"joujou"))

func _process(_delta):
	pass

func joujou(txt):
	print("testi",txt)
