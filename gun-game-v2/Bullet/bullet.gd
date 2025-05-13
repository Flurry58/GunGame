class_name Bullet extends StaticBody2D

signal Do_Damage(Amount)

@export var bullet_speed = 100 #pixels/sec
@export var exist_time = 3 #seconds bullet will exist

var Damage_Amount:int
var velocity = Vector2()
var timer

var parent_type #IF body is parent type do not delete bullet
func _ready():
	$Timer.wait_time = exist_time
	$Timer.start()
	
func shoot(pos, dir, damage):
	position = pos
	rotation = dir
	velocity = Vector2(bullet_speed, 0).rotated(rotation)
	Damage_Amount = damage
	
func _physics_process(delta):
	move_and_collide(velocity * delta)
	
func _on_timer_timeout() -> void:
	self.queue_free()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
<<<<<<< Updated upstream
	if parent_type not in body.get_groups():
		Do_Damage.connect(body.Mediator.process_signal)
		Do_Damage.emit("Health Component", [Damage_Amount])
		self.queue_free()
=======
	collision_handling(body_rid, body, body_shape_index, local_shape_index)

func _on_area_2d_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	collision_handling(area_rid, area, area_shape_index, local_shape_index)

func collision_handling(col_rid: RID, area_or_body, shape_index: int, local_shape_index: int) -> void:
	if "TileMap" in area_or_body.get_groups():
		self.queue_free()
		return
		
	elif parent_type not in area_or_body.get_groups():
		if area_or_body.get_node("%Mediator"):
			Do_Damage.connect(area_or_body.Mediator.process_signal)
			Do_Damage.emit("Health Component", [Damage_Amount])
			self.queue_free()
>>>>>>> Stashed changes
