extends Node

@onready var current_state = $Idle
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_state.do_process(delta)

func get_state_velocity() -> Vector2:
	return current_state.velocity
	#returns velocity of current state

func change_state(newstate):
	current_state = newstate

func _on_shooting_change_state(state: Variant) -> void:
	change_state(state)


func _on_idle_change_state(state: Variant) -> void:
	change_state(state)
