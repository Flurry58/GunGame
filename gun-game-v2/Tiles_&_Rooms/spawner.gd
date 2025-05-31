extends Marker2D

@export var Enemy_TypePath: String

var temp

func _on_enimies_spawn_enemies() -> void:
	temp = load(Enemy_TypePath)
	add_child(temp.instantiate())
