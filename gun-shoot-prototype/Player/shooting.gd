extends Node

signal change_state(state)

var velocity : Vector2 = Vector2.ZERO
var _linear_easing_pos: float = 0.0
var current_velocity = Vector2(1,1)
var constvos = Vector2(1,1)


# Called when the node enters the scene tree for the first time.
func enter_state(parent):
	_linear_easing_pos = 0
	current_velocity = Vector2(1,1)
	constvos = Vector2(1,1)
	current_velocity *= rotation_to_direction(parent.rotation) * -2000

func do_process(delta, velocity, direction):
	var changeout = (1 - ease(_linear_easing_pos, 0.33))
	constvos *= changeout
	velocity = constvos
	
	
	
	_linear_easing_pos += delta
	
	return velocity
	
	
	


func rotation_to_direction(rotation_radians: float) -> Vector2:
	rotation_radians = rotation_radians + PI/2
	var direction = Vector2(cos(rotation_radians), sin(rotation_radians))
	direction = direction.normalized()
	return direction
