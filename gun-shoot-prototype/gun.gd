extends Node2D
#Empty node as it is just a script and as of now has no in game presense as an asset, will be converted to its own scene that
#can be instatiated in the future
class_name AK


var _linear_easing_pos: float = 0.0
var constvos = Vector2(1,1)

#Convert rotation radians too a vector 
func rotation_to_direction(rotation_radians: float) -> Vector2:
	rotation_radians = rotation_radians + PI/2
	var direction = Vector2(cos(rotation_radians), sin(rotation_radians))
	direction = direction.normalized()
	return direction

func enter_state(rotation):
	_linear_easing_pos = 0
	constvos = Vector2(1,1)
	constvos *= rotation_to_direction(rotation) * -2000
	
func gun_recoil(velocity, delta):
	$AnimatedSprite2D.play("shoot")
	if _linear_easing_pos > 0.3:
		return Vector2(0,0) #exit shooting state
	else:
		var changeout = (1 - ease(_linear_easing_pos, 0.11))
		constvos *=  changeout
		_linear_easing_pos += delta
		return constvos

func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.play("idle")

func shootgun():
	pass #Shoots the bullets
