extends ChaseState

func enter(previous_state_path: String, data := {}) -> void:
	actor_setup.call_deferred()

func actor_setup():
	await get_tree().physics_frame
	set_movement_target(enemy.player.position)
	
func reached_destination() -> void:
	if enemy.nav.is_navigation_finished():
		finished.emit(FLEE)
		return
