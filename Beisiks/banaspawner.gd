extends Node2D

@export var ban : Resource
var junkle = false
var omahuone = null

func _ready():
	randomize()

func _process(_delta):
	pass

func _on_timer_timeout():
	if junkle:
		$Timer.wait_time = randf_range(0.1,0.5)
		var bana = ban.instantiate()
		add_child(bana)
		bana.position.x = randi_range(0,800) - 400
		bana.connect("plots",Callable(self,"plei"))

func plei():
	if junkle: $PLOTS.play()

func _on_area_2d_area_entered(area):
	omahuone = area
