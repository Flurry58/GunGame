extends ChaseState

func reached_destination() -> void:
	if enemy.nav.is_navigation_finished():
		finished.emit(FLEE)
		return
