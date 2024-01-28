extends Node2D

@export var tekstiresu : Resource
@export var peluri : Resource
@export var paussi : Resource

@onready var lorez = get_node("Lores")
@onready var tpaikka = get_node("Tekstipaikka")
@onready var cam = get_node("Camera2D")
@onready var panaspawn = get_node("banaspawner")

func _ready():
	#long text is probably too annoying for every start...
	#tekstaa("This is it. A dead end. There are harder hardships ahead and even worse worsehsips... The journey won't be easy, for your sanity. The route is dark as the blackest of darknesses and beyond. Pure evilship in the depths of evil itself. Now you can press X... ha, you fell for that! This intro still goes on, although there actually wasn't much else to say, so, yeah. \n[Press X]")
	tekstaa("There are harder hardships ahead and even worse worships. The long journey is dark as the blackest of darknesses and beyond – it is pure evilship in the depths of the eviliest evils itself...\n[Press X to continue]")
	var pel = peluri.instantiate()
	add_child(pel)
	pel.position = Vector2i(512,-32)#7 6
	pel.connect("kamera",Callable(self,"laitakamera"))
	for lore in lorez.get_children():
		lore.connect("loretime",Callable(self,"tekstaa"))

func _input(_event):
	if Input.is_action_just_pressed("ui_cancel"):
		vaihda_skenee(Global.mainmenu)
	if Input.is_action_just_pressed("key_enter"):
		get_tree().paused = true
		var p = paussi.instantiate()
		$Pausekanva.add_child(p)

func vaihda_skenee(skene):
	var s = skene.instantiate()
	#get_parent().add_child(s) #add new scene at a higher parent hierarchy
	get_tree().root.add_child(s) #this is probably the recommended solution...
	queue_free() #leave and refuse to elaborate

func tekstaa(txt):
	var t = tekstiresu.instantiate()
	tpaikka.add_child(t)
	t.teksti.text = txt
	$wapawapa.play()
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

func ded():
	for line in $dedis.get_children(): line.kuole()
	$Kohtalo.start()

func _on_kohtalo_timeout():
	vaihda_skenee(Global.lopetus)
