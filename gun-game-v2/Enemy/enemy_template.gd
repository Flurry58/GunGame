class_name EnemyTemplate extends StaticBody2D
var velocity = Vector2()
@export var speed: int
func _on_mediator_child_output(child_name: String, data: Array) -> void:
	pass # Replace with function body.
	
func _physics_process(delta):
	move_and_collide(velocity * delta * speed)
