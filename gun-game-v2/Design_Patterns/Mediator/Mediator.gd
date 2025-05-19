class_name Mediator extends Node

var signal_dicts = {}
var signal_out = {}

signal child_output(child_name:String, data: Array)

func _ready() -> void:
	for component_node in find_children("*", "Component"):
		signal_dicts[component_node.name] = Callable(component_node, "work")
		component_node.connect("output", output_signals)
	
func process_signal(target_string: String, data: Array) -> void:
	if target_string in signal_dicts:
		signal_dicts[target_string].call(data)
		
func output_signals(child_name: String, data: Array) -> void:
	child_output.emit(child_name, data)
