class_name Pistol extends Gun

@export var Damage:int
var _linear_easing_pos: float = 0.0
var constvos = Vector2(1,1)

func _ready() -> void:
	bullet_object_loaded = preload("res://Bullet/bullet.tscn")
		
func shoot(player):
	constvos = Vector2(1,1)
	_linear_easing_pos = 0.0
	var bul = bullet_object_loaded.instantiate()
	bul.parent_type = player.get_groups()[0]
	bul.shoot(to_global($Muzzle.position), rotation, Damage)
	player.main_scene.add_child(bul)
	

func physics_update(_delta: float) -> Vector2:
	if constvos < Vector2(0.05, 0.05):
		Finished.emit()
		return Vector2.ZERO
	
	
	var changeout = (1 - ease(_linear_easing_pos, 0.11))
	constvos *=  changeout
	_linear_easing_pos += _delta
	return constvos * (rotation_to_direction(rotation)) * -2
