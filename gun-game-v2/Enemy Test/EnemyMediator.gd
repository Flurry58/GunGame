class_name Mediator extends Node

var signal_dicts = {}
func _ready() -> void:
	for component_node in find_children("*", "Component"):
		signal_dicts[component_node.name] = Callable(component_node, "work")

# Called when the node enters the scene tree for the first time.
		
func process_signal(target_string: String, data: Array) -> void:
	if target_string in signal_dicts:
		signal_dicts[target_string].call(data)
