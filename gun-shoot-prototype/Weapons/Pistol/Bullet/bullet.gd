extends StaticBody2D


@export var bullet_speed = 750 #pixels/sec
var velocity = Vector2()


func shoot(pos, dir):
	position = pos
	rotation = dir
	velocity = Vector2(bullet_speed, 0).rotated(rotation)


func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	
func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("enemies"):
		body.queue_free()
	queue_free()
