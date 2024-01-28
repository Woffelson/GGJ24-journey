extends RigidBody2D

@onready var animu = get_node("AnimatedSprite2D")

func _on_area_2d_body_entered(body):
	if body.is_in_group("dead") && !body.freeze:
		print("AAA")
		call_deferred("set_freeze_enabled",false)
