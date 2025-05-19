extends TextureProgressBar


func _on_health_component_output(my_name: String, data: Array) -> void:
	value = data[0]
