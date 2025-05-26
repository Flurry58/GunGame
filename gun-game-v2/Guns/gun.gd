class_name Gun extends Node2D

var bullet_object_loaded

var _linear_easing_pos: float = 0.0
var constvos = Vector2(1,1)

@export var Damage:int

@export var Ammo_Node: Ammo
@export var Ammo_usage_amount: int


signal Finished

#State Machine to Manage when we are moving the player and when to free the player to move again
var Shooting = true

func rotation_to_direction(rotation_radians: float) -> Vector2:
	rotation_radians = rotation_radians 
	var direction = Vector2(cos(rotation_radians), sin(rotation_radians))
	direction = direction.normalized()
	return direction
	
func physics_update(_delta: float) -> Vector2:
	return Vector2.ZERO
	
	
func shoot(shooter):
	pass

#look at mouse
func face_mouse_update() -> void:
	look_at(get_global_mouse_position())

func pause_ammo_regen():
	Ammo_Node.regen_pause()
	
func resume_ammo_regen():
	Ammo_Node.resume_regen()
	
func change_ammo():
	Ammo_Node.set_ammo_manually()
