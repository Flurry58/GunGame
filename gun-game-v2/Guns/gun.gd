class_name Gun extends Node2D

var bullet_object_loaded

signal Finished

#State Machine to Manage when we are moving the player and when to free the player to move again
var Shooting = true

func rotation_to_direction(rotation_radians: float) -> Vector2:
	rotation_radians = rotation_radians 
	var direction = Vector2(cos(rotation_radians), sin(rotation_radians))
	direction = direction.normalized()
	return direction
	
func physics_update(_delta: float) -> Vector2:
	return Vector2.ZERO
	
	
func shoot(shooter):
	pass

#look at mouse
func face_mouse_update() -> void:
	look_at(get_global_mouse_position())
