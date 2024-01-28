extends RigidBody2D

func _on_timer_timeout():
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("dead"):
		get_parent().ded()
