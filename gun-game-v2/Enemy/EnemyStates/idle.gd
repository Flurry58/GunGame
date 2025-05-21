extends EnemyState


func enter(previous_state_path: String, data := {}) -> void:
	actor_setup.call_deferred()

func actor_setup():
	await get_tree().physics_frame
	set_movement_target(enemy.player.position)
	
func set_movement_target(movement_target: Vector2):
	enemy.nav.target_position = movement_target
	
func physics_update(_delta: float) -> void:
	enemy.direction = (enemy.player.position - enemy.position)
	enemy.raycast.target_position = enemy.direction
	
	if not enemy.raycast.is_colliding():
		finished.emit("Chase")
		return
