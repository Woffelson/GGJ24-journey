extends CharacterBody2D

@export var proje : Resource

var hor = 0
var dir = -1

const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 2

signal kamera(alue)

@onready var torso = get_node("Torso")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("key_z") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Anim.play("jump")
	if Input.is_action_pressed("key_z"): velocity.y -= 20

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	hor = Input.get_axis("ui_left", "ui_right")
	if hor != 0:
		velocity.x = hor * SPEED
		if is_on_floor(): $Anim.play("walk")
		elif velocity.y > 0: $Anim.play("drop")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor(): $Anim.play("idle")
		elif velocity.y > 0: $Anim.play("drop")
	if Input.is_action_just_pressed("ui_left"): torso.scale.x = 2 #hnngghh toimi ny
	elif Input.is_action_just_pressed("ui_right"): torso.scale.x = -2
	
	if Input.is_action_pressed("ui_down"):
		call_deferred("set_collision_mask_value",2,false)#set_collision_mask_value(layer,false)
	else: call_deferred("set_collision_mask_value",2,true)#set_collision_mask_value(layer,true)
	
	move_and_slide()
	if Input.is_action_just_pressed("key_x"):
		if $Kepu.get_current_animation_length() == $Kepu.get_current_animation_position():
			var pro = proje.instantiate()
			get_parent().add_child(pro)
			pro.position = position - Vector2(0,32)
			pro.linear_velocity.x = 500 * -sign(torso.scale.x)
			$Kepu.play("viuh")

func _on_roomcheck_area_entered(area):
	emit_signal("kamera",area)
	if area.is_in_group("bana"):
		velocity.x = randi_range(0,400) - 400
		velocity.y = randi_range(0,400) - 400
