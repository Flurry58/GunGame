extends EnemyState


var vector_list = [Vector2(0,-1),Vector2(1,-1),Vector2(1,0),Vector2(1,1),Vector2(0,1),Vector2(-1,1),Vector2(-1,0),Vector2(-1,-1)]
@onready var player: Player = get_tree().get_nodes_in_group("Player")[0]
## Called by the state machine on the engine's main loop tick.
func update(_delta: float) -> void:
	pass
	
	
func physics_update(_delta: float) -> void:
	var curpos: Vector2 = enemy.global_position
	var playpos: Vector2 = enemy.to_local(player.global_position)
	#print("Current Position: ", enemy.global_position)
	#print("Global Vector towards player: ", player.global_position)
	#print("Local Vector towards player: ", playpos)
	#print("Local Vector normalized: ", playpos.normalized())
	
	
	var vectorpoint: Vector2 = playpos.normalized()
	

	var intrestvector = vector_list.map(func(direction): return vectorpoint.dot(direction))

	var dangerarray = %context_map.request_raycast_collision_update()

	intrestvector = AutoloadSignelton.subtract_list(intrestvector, dangerarray)	
	var best_direction = intrestvector.max()

	var indextarg = intrestvector.find(best_direction)
	var steering_force = vector_list[indextarg] - enemy.velocity
	
	
	enemy.velocity = enemy.velocity + (steering_force * _delta)
	
	%context_map.color_ray(indextarg)
	

	
func enter(previous_state_path: String, data := {}) -> void:
	pass

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
	pass
