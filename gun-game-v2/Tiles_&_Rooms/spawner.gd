extends Marker2D

@export var Enemy_TypePath: String

var temp
func _ready() -> void:
	temp = load(Enemy_TypePath)
	add_child(temp.instantiate())
	
