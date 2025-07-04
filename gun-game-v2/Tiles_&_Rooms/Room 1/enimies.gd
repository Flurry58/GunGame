extends Node2D

signal enemey_dead
signal spawn_enemies

func _on_spawner_child_exiting_tree(node: Node) -> void:
	print(node)
	enemey_dead.emit()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player"):
		print("Player detected")
		spawn_enemies.emit()
