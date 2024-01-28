extends RigidBody2D

@onready var animu = get_node("AnimatedSprite2D")

func _ready():
	var tween = create_tween().set_loops()
	tween.tween_property($AnimatedSprite2D,"modulate",Color(1,1,1,0.5),1)
	tween.tween_property($AnimatedSprite2D,"modulate",Color(1,1,1,0.75),1)

func kuole():
	call_deferred("set_freeze_enabled",false)
	animu.play("dead")
	$kallot.show()

func _on_area_2d_body_entered(body):
	if body.is_in_group("dead") && !body.freeze:
		call_deferred("set_freeze_enabled",false)
