extends TileMapLayer

var _obstacles: Array[TileMapLayer] = []

func _ready() -> void:
	_get_obstacle_layers()

func _get_obstacle_layers():
	# make sure the name here is the same as the group's
	var layers = get_tree().get_nodes_in_group("Obstacles")

	for layer in layers:
		if layer is not TileMapLayer: continue
		_obstacles.append(layer)
