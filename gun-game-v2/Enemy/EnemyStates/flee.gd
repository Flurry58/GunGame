extends EnemyState

@export var Flee_Intensity: int
var theta = PI

var target_pos
func enter(previous_state_path: String, data := {}) -> void:
	move_()

func physics_update(_delta: float) -> void:
	#enemy.direction = (enemy.player.position - enemy.position)
	enemy.move_to_target(target_pos)	
	
	if enemy.nav.is_navigation_finished():
		finished.emit(IDLE)
		
	
	

#Work on, make it so it goes opposite the target of the vector
func move_() -> void:
	target_pos = enemy.raycast.target_position
	enemy.raycast.target_position = -5 * target_pos
	target_pos *= -5
	target_pos = enemy.to_global(target_pos)
	
	
	
		
	enemy.move_to_target(target_pos)
