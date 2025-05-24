extends PlayerState


signal imunity_frames(NodeTarget, data)

var Current_Direction = "DOWN"

var Direction_Events : Array[String] = ["UP", "DOWN", "LEFT", "RIGHT"]

func enter(previous_state_path: String, data := {}) -> void:
	imunity_frames.emit("Health Component", {"I_Frame": false})
	#finished.emit(SHOOTING)


func physics_update(_delta: float) -> void:
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	player.current_gun.face_mouse_update()
	player.velocity = input_direction * player.speed
	
	player.move_and_slide()
	
	if Input.is_action_just_pressed("Shoot"):
		finished.emit(SHOOTING)
		
	if Input.is_action_pressed("Swap_1") and player.Equipped_Guns.find(player.current_gun) != 0:
		finished.emit(SWITCH, {"Gun": 0, "Current": player.current_gun})
		
	if Input.is_action_pressed("Swap_2") and player.Equipped_Guns.find(player.current_gun) != 1:
		finished.emit(SWITCH, {"Gun": 1, "Current": player.current_gun})
