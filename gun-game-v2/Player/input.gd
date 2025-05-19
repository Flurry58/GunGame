extends PlayerState

var Current_Direction = "DOWN"

var Direction_Events : Array[String] = ["UP", "DOWN", "LEFT", "RIGHT"]

func enter(previous_state_path: String, data := {}) -> void:
	pass
	#finished.emit(SHOOTING)


func physics_update(_delta: float) -> void:
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	player.current_gun.face_mouse_update()
	player.velocity = input_direction * player.speed
	
	player.move_and_slide()
	
	if Input.is_action_just_pressed("Shoot"):
		finished.emit(SHOOTING)
