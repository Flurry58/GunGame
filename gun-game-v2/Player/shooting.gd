extends PlayerState


func enter(previous_state_path: String, data := {}) -> void:
	player.current_gun.Finished.connect(Exit_Shooting)
	player.current_gun.shoot(player)

func physics_update(_delta: float) -> void:
	player.velocity = player.current_gun.physics_update(_delta) * player.speed
	player.move_and_slide()
	
func Exit_Shooting():
	finished.emit(INPUT)
