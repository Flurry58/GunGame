extends EnemyState

## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	pass
	
func physics_update(_delta: float) -> void:
	pass

func enter(previous_state_path: String, data := {}) -> void:
	pass

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass
