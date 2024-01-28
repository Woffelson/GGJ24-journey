extends RigidBody2D

signal plots()

func _ready():
	angular_velocity = randi_range(0,100)

func _process(_delta):
	pass#if linear_velocity.y == 0: emit_signal("plots")

func _on_timer_timeout():
	emit_signal("plots")
	queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("proje"): set_modulate(Color.SADDLE_BROWN)
