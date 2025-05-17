extends EnemyTemplate
signal send_velocity(data: Vector2)

var direction : Vector2

@onready var player = get_tree().get_nodes_in_group("Player")[0]

var speed = 10

signal Do_Damage(Amount)
const Damage_Amount = 20
func _on_mediator_child_output(child_name: String, data: Array) -> void:
	if child_name == "Health" and data[0] == 0:
		self.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	Do_Damage.connect(body.Mediator.process_signal)
	Do_Damage.emit("Health Component", [Damage_Amount])
