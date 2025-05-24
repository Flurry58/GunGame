extends EnemyState

	
func set_movement_target(movement_target: Vector2):
	enemy.nav.target_position = movement_target
	
func physics_update(_delta: float) -> void:
	if enemy.start_ai:
		enemy.direction = (enemy.player.position - enemy.position)
		enemy.raycast.target_position = enemy.to_local(enemy.player.position)
		
		enemy.sight_ray.target_position = enemy.to_local(enemy.player.position)

		if not enemy.sight_ray.is_colliding():
			finished.emit("Chase")
			return
