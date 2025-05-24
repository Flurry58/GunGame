class_name Pistol extends Gun

@export var Damage:int
var _linear_easing_pos: float = 0.0
var constvos = Vector2(1,1)

@export var Ammo_Node: Ammo
@export var Ammo_usage_amount: int

func _ready() -> void:
	bullet_object_loaded = preload("res://Guns/Bullet/bullet.tscn")
		
func shoot(player):
	if Ammo_Node.current > 0:
		constvos = Vector2(1,1)
		_linear_easing_pos = 0.0
		var bul = bullet_object_loaded.instantiate()
		bul.parent_type = player.get_groups()[0]
		bul.shoot(to_global($Muzzle.position), rotation, Damage)
		player.main_scene.add_child(bul)

		Ammo_Node.change(-1 * Ammo_usage_amount)
	

func physics_update(_delta: float) -> Vector2:
	if constvos < Vector2(0.05, 0.05):
		Finished.emit()
		return Vector2.ZERO
	
	var changeout = (1 - ease(_linear_easing_pos, 0.11))
	constvos *=  changeout
	_linear_easing_pos += _delta
	return constvos * (rotation_to_direction(rotation)) * -2

func pause_ammo_regen():
	Ammo_Node.regen_pause()
	
func resume_ammo_regen():
	Ammo_Node.resume_regen()
	
func change_ammo():
	Ammo_Node.set_ammo_manually()
