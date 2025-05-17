extends EnemyState


func physics_update(_delta: float) -> void:
	enemy.direction = (enemy.player.position - enemy.position)
	enemy.direction = enemy.direction.normalized()
	
	
	enemy.send_velocity.emit(enemy.direction.floor())
	
	
	enemy.velocity = enemy.direction * enemy.speed

#	print(enemy.velocity)
	enemy.move_and_slide()
