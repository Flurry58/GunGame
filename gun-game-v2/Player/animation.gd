extends AnimatedSprite2D
@onready var Player = $AnimationPlayer

func _process(delta):
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	change_animation_direction(input_direction)
	
func change_animation_direction(input_direction):
	

	if Input.is_action_pressed("Up"):
		$AnimationStates._transition_to_next_state("Up")
	elif Input.is_action_pressed("Down"):
		$AnimationStates._transition_to_next_state("Down")
	elif Input.is_action_pressed("Left"):
		$AnimationStates._transition_to_next_state("Left")
	elif Input.is_action_pressed("Right"):
		$AnimationStates._transition_to_next_state("Right")
	if input_direction == Vector2.ZERO:
		pause()
	
