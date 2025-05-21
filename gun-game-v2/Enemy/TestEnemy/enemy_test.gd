extends EnemyTemplate
signal send_velocity(data: Vector2)
signal update_health_bar(amount)

signal Do_Damage(Amount)

func _on_mediator_child_output(child_name: String, data: Array) -> void:
	if child_name == "Health":
		if data[0] == 0:
			self.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	Do_Damage.connect(body.Mediator.process_signal)
	Do_Damage.emit("Health Component", [Damage_Amount])



	
