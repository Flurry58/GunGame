extends EnemyTemplate

func _on_mediator_child_output(child_name: String, data: Array) -> void:
	print(data)
	if child_name == "Health" and data[0] == 0:
		self.queue_free()
