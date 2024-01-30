extends TextureRect

func _input(_event):
	if Input.is_action_just_pressed("key_left") || Input.is_action_just_pressed("key_right"):
		if texture.current_frame == 0:
			texture.current_frame = 1
			$inventory.hide()
			$map.show()
		else:
			texture.current_frame = 0
			$inventory.show()
			$map.hide()
	if Input.is_action_just_pressed("key_enter"):
		print("hääähh")
		await get_tree().process_frame
		get_tree().paused = false
		queue_free()
