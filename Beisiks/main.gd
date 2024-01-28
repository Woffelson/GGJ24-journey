extends Node2D

@export var tekstiresu : Resource
@export var peluri : Resource

@onready var lorez = get_node("Lores")
@onready var tpaikka = get_node("Tekstipaikka")
@onready var cam = get_node("Camera2D")
@onready var panaspawn = get_node("banaspawner")

func _ready():
	#joujou("This is it. A dead end. There are harder hardships ahead and even worse worsehsips... The journey won't be easy, for your sanity. The route is dark as the blackest of darknesses and beyond. Pure evilship in the depths of evil itself. Now you can press X... ha, you fell for that! This intro still goes on, although there actually wasn't much else to say, so, yeah. \n[Press X]")
	var pel = peluri.instantiate()
	add_child(pel)
	pel.position = Vector2i(512,320)#7
	pel.connect("kamera",Callable(self,"laitakamera"))
	for lore in lorez.get_children():
		lore.connect("loretime",Callable(self,"joujou"))

func _process(_delta):
	pass

func joujou(txt):
	var t = tekstiresu.instantiate()
	tpaikka.add_child(t)
	t.teksti.text = txt
	$wapawapa.play()
	#print("testi",txt)
	get_tree().paused = true

func laitakamera(areena):
	cam.position = areena.position
	panaspawn.position = Vector2i(cam.position.x,cam.position.y-320)
	if areena.get_meta("junkle"):
		$CanvasLayer/junkle.show()
		$CanvasLayer/def.hide()
		$Tekstipaikka/ColorRect.hide()
		if !$VIIRAKKO.is_playing():
			$VIIRAKKO.play()
			$darksong.stop()
		panaspawn.junkle = true
	else:
		$CanvasLayer/junkle.hide()
		$CanvasLayer/def.show()
		$Tekstipaikka/ColorRect.show()
		if !$darksong.is_playing():
			$VIIRAKKO.stop()
			$darksong.play()
		panaspawn.junkle = false
