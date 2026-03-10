extends TextureProgressBar



func _on_health_component_show_shield(Shield_Amount: Variant) -> void:
	print(Shield_Amount)
	value = Shield_Amount
	show()


func _on_health_component_shield_empty() -> void:
	hide()
