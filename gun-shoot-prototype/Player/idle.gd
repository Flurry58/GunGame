extends Node

signal change_state(state)
# Called when the node enters the scene tree for the first time.


func do_process(delta, velocity, direction):
	velocity += direction * 50
	
	return velocity
