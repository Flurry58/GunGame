extends EnemyTemplate

signal send_velocity(data: Vector2)
signal update_health_bar(amount)
signal Do_Damage(data: Dictionary)



func _on_mediator_child_output(child_name: String, data: Dictionary) -> void:
	if child_name == "Health" and data.has("Current"):
		if data["Current"] == 0:
			self.queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	Do_Damage.connect(body.Mediator.process_signal)
	Do_Damage.emit("Health Component", {"Change":Damage_Amount})

func _physics_process(delta: float) -> void:
	var output = Vector2.RIGHT.rotated(round(velocity.angle() / TAU * 4) * TAU / 4).snapped(Vector2.ONE)
	send_velocity.emit(output)

	
