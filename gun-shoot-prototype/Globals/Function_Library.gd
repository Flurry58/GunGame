extends Node


func rotation_to_direction(rotation_radians: float) -> Vector2:
	rotation_radians = rotation_radians 
	var direction = Vector2(cos(rotation_radians), sin(rotation_radians))
	direction = direction.normalized()
	return direction
