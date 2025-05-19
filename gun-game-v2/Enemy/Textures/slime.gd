extends AnimatedSprite2D


@onready var Player = $AnimationPlayer


func _on_enemy_main_send_velocity(data: Vector2) -> void:
	if data == Vector2(0.0, -1.0):
		$AnimationStates._transition_to_next_state("Right")
	elif data == Vector2(0.0, 0.0):
		$AnimationStates._transition_to_next_state("Down")
	elif data == Vector2(-1.0, 0.0):
		$AnimationStates._transition_to_next_state("Left")
	else:
		$AnimationStates._transition_to_next_state("Up")
