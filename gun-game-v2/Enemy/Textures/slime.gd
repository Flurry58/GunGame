extends AnimatedSprite2D

var can_change = true

@onready var Player = $AnimationPlayer



func _on_enemy_main_send_velocity(data: Vector2) -> void:
	if can_change:
		if data == Vector2(0.0, 1.0):
			can_change = false
			$AnimationStates._transition_to_next_state("Right")
		elif data == Vector2(1.0, 0.0):
			can_change = false
			$AnimationStates._transition_to_next_state("Down")
		elif data == Vector2(-1.0, 0.0):
			can_change = false
			$AnimationStates._transition_to_next_state("Left")
		else:
			can_change = false
			$AnimationStates._transition_to_next_state("Up")


func _on_animation_looped() -> void:
	can_change = true
