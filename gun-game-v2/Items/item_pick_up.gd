extends Node2D

class_name Item

signal player_pickup(player_body)

func _on_collision_detect_body_entered(body: Node2D) -> void:
	player_pickup.emit(body)
