class_name ChaseState extends EnemyState

#Just to set up the navigation agent
	
#-----------------------------------------------

func physics_update(_delta: float) -> void:
	enemy.direction = (enemy.player.position - enemy.position)
	enemy.raycast.target_position = enemy.direction
	move_()

func move_() -> void:
	if enemy.lineofsight:
		in_line_of_sight()

	if enemy.nav.is_navigation_finished():
		reached_destination()
	
	enemy.move_to_target(enemy.player.position)	

func reached_destination() -> void:
	pass
	
	
func in_line_of_sight() -> void:
	enemy.direction = (enemy.player.position - enemy.position)
	enemy.raycast.target_position = enemy.direction
	if enemy.direction.length() > enemy.chase_length or enemy.raycast.is_colliding():
		finished.emit(IDLE)

			
func _velocity_computed(safe_velocity: Vector2):
	enemy.velocity = safe_velocity
	
func set_movement_target(movement_target: Vector2):
	enemy.nav.target_position = movement_target
