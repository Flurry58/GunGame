extends Sprite2D

signal CreateShield(data: Dictionary)

var ShieldAmount: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_pick_up_player_pickup(player_body: Variant) -> void:
	CreateShield.connect(player_body.Mediator.process_signal)
	CreateShield.emit("Health Component", {"Shield":ShieldAmount})
	self.queue_free()
