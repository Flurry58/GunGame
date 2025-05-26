extends Node2D

signal enemey_dead

func _on_spawner_child_exiting_tree(node: Node) -> void:
	enemey_dead.emit()
