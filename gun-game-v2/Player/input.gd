extends PlayerState

var Current_Direction = "DOWN"

var Direction_Events : Array[String] = ["UP", "DOWN", "LEFT", "RIGHT"]

func enter(previous_state_path: String, data := {}) -> void:
	pass
	#finished.emit(SHOOTING)


func physics_update(_delta: float) -> void:
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	change_animation_direction(input_direction)
	player.current_gun.face_mouse_update()
	player.velocity = input_direction * player.speed
	
	player.move_and_slide()
	
	if Input.is_action_just_pressed("Shoot"):
		finished.emit(SHOOTING)

func change_animation_direction(input_direction):
	if Input.is_action_just_pressed("Up"):
		player.Animator.play("Up")
	elif Input.is_action_just_pressed("Down"):
		player.Animator.play("Down")
	elif Input.is_action_just_pressed("Left"):
		player.Animator.play("Left")
	elif Input.is_action_just_pressed("Right"):
		player.Animator.play("Right")
	if input_direction == Vector2.ZERO:
		player.Animator.pause()
