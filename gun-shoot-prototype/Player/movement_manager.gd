extends Node


var move_speed = 500


func _direction() -> Vector2:
	return Input.get_vector("left", "right", "up", "down")


func calculate_movement(delta: float) -> Vector2:
	return _direction() * move_speed
