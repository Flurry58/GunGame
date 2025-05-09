class_name Enemy extends StaticBody2D

@onready var Health = $Health
@onready var Mediator = $Mediator


func _process(delta: float) -> void:
	pass


func _on_mediator_child_output(child_name: String, data: Array) -> void:
	if child_name == "Health" and data[0] == 0:
		self.queue_free()
