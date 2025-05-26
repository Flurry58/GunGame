extends EnemyState

func set_movement_target(movement_target: Vector2):
	enemy.nav.target_position = movement_target


func physics_update(_delta: float) -> void:
	if enemy.start_ai:
		enemy.direction = (enemy.player.position - enemy.position)
		enemy.raycast.target_position = enemy.to_local(enemy.player.position)
		
		enemy.sight_ray.target_position = enemy.to_local(enemy.player.position)
		
		if enemy.lineofsight:
			var distance = enemy.position.distance_to(enemy.sight_ray.target_position)
			#get distance from vector target,
			#use this distance to see if the player is in the enemies sight range
			
			if not enemy.sight_ray.is_colliding() and distance < enemy.chase_length:
				finished.emit("Chase")
				return
