extends Sprite2D

signal RestoreHealth(data: Dictionary)

@export var RestoreHealthAmount: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_pick_up_player_pickup(player_body: Variant) -> void:
	RestoreHealth.connect(player_body.Mediator.process_signal)
	RestoreHealth.emit("Health Component", {"Change":-1 * RestoreHealthAmount})
	self.queue_free()
