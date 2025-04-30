extends Node2D
#Empty node as it is just a script and as of now has no in game presense as an asset, will be converted to its own scene that
#can be instatiated in the future
class_name AK

@export var Bullet : PackedScene

var _linear_easing_pos: float = 0.0
var constvos = Vector2(1,1)

var rot_angle

var del

var shooting = false




func put_away():
	$Ammo_Handler.pause_reload()

func take_out():
	$Ammo_Handler.resume_reload()


func enter_state(rotation_input):
	if not shooting:
		if $Ammo_Handler.current_ammo > 0:
			$AnimatedSprite2D.play("shoot")
			rot_angle = get_parent().rotation
			_linear_easing_pos = 0
			constvos = Vector2(1,1)
			constvos *= FunctionLibrary.rotation_to_direction(rotation_input) * -2000
			shootgun(rotation_input)
			shooting = true
		else:
			get_parent().state = 'idle'
	
	
	
func gun_recoil(velocity, delta):
	
	var changeout = (1 - ease(_linear_easing_pos, 0.11))
	constvos *=  changeout
	_linear_easing_pos += delta
	return constvos

func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("idle")
	$Timer.start(0.5)


func _on_animated_sprite_2d_frame_changed() -> void:
	if $AnimatedSprite2D.frame % 2 == 0 and $AnimatedSprite2D.animation == 'shoot' and $Ammo_Handler.current_ammo > 0:
		shootgun(get_parent().rotation) # give shoot gun the players rotation
		constvos = Vector2(1,1) 
		constvos *= FunctionLibrary.rotation_to_direction(get_parent().rotation) * -2000
		_linear_easing_pos = 0

func shootgun(angle):
	var level_root = get_parent().get_parent()
	var b = Bullet.instantiate()
	level_root.add_child(b) #add it to the level scene so that it moves independently of the player

	b.shoot(to_global($Muzzle.position), angle)
	$Ammo_Handler.use_ammo(1)
	shooting = false


func _on_timer_timeout() -> void:
	shooting = false
	get_parent().state = 'idle'
	
