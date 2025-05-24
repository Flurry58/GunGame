extends TextureProgressBar


func _on_health_component_output(my_name: String, data: Dictionary) -> void:
	if data.has("Current"):
		value = data["Current"]
	if data.has("Max"):
		max_value = data["Max"]
