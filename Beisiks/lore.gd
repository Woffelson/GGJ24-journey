extends Area2D

@export var fyssat = false
@export var txt_index = 0
@export var tekstit = []

var teksti = ""
var kontaktor = null

signal loretime(txt)

@onready var lbl = get_node("Label")
@onready var fysik = get_node("fysik")

func _ready():
	var teks = tekstit[txt_index].split(": ")
	teksti = ":\n\n".join(teks) #add newlines by code, because exported arrays don't support them
	if !fyssat: fysik.freeze = true

func _physics_process(_delta):
	position += fysik.position
	if kontaktor != null && fyssat:
		#fysik.linear_velocity += kontaktor.velocity.normalized() * 8
		fysik.linear_velocity.y = kontaktor.velocity.y/2
		fysik.linear_velocity.x += kontaktor.hor * 2# * 32

func _input(_event):
	if Input.is_action_just_pressed("key_x") && lbl.visible: #probably not the best solution
		emit_signal("loretime",teksti)
		#print(teksti)

func _on_body_entered(body): #player hits near
	if body.is_in_group("player"):
		#emit_signal("loretime")
		lbl.show()
		kontaktor = body
		if txt_index == 10: $fysik/AnimatedSprite2D.play("blah")

func _on_body_exited(body): #player exits presence
	if body.is_in_group("player"):
		lbl.hide()
		kontaktor = null
		if txt_index == 10: $fysik/AnimatedSprite2D.play("default")
