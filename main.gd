extends Node2D

@export var tekstiresu : Resource

@onready var lorez = get_node("Lores")
@onready var tpaikka = get_node("Tekstipaikka")

func _ready():
	for lore in lorez.get_children():
		lore.connect("loretime",Callable(self,"joujou"))

func _process(_delta):
	pass

func joujou(txt):
	var t = tekstiresu.instantiate()
	tpaikka.add_child(t)
	t.teksti.text = txt
	#print("testi",txt)
