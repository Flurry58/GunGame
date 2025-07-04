class_name AK extends Gun

var bullets_shot = 0
var burst_limit = 4
var player_var = 0
func _ready() -> void:
	bullet_object_loaded = preload("res://Guns/Bullet/bullet.tscn")

func spawn_bullet(player):
	if Ammo_Node.current > 0:
		constvos = Vector2(1,1)
		_linear_easing_pos = 0.0
		var bul = bullet_object_loaded.instantiate()
		bul.parent_type = player.get_groups()[0]
		bul.shoot(to_global($Muzzle.position), rotation, Damage)
		player.main_scene.add_child(bul)
		Ammo_Node.change(-1 * Ammo_usage_amount)
		return true
	else:
		return false
		
func shoot(player):
	player_var = player
	if bullets_shot == 0:
		spawn_bullet(player)
	

func physics_update(_delta: float) -> Vector2:
	if constvos < Vector2(0.05, 0.05):
		print(bullets_shot)
		if bullets_shot == burst_limit:
			bullets_shot = 0
			Finished.emit()
			return Vector2.ZERO
		
		if spawn_bullet(player_var):
			_linear_easing_pos = 0
			bullets_shot += 1
		else:
			bullets_shot = 0
			Finished.emit()
			return Vector2.ZERO
	
	var changeout = (1 - ease(_linear_easing_pos, 0.11))
	constvos *=  changeout
	_linear_easing_pos += _delta
	return constvos * (rotation_to_direction(rotation)) * -2
	
