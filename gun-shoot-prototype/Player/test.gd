extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	look_at(get_global_mouse_position())  
	#$AnimatedSprite2D.rotate(deg_to_rad(-90)) #Or -90  
	var move_input = Input.get_axis("up", "down")
	velocity = transform.x * move_input * SPEED
	move_and_slide()
