class_name Ammo extends Node

@export var total: int
@export var usage_amount: int
@export var regen_time: int


var current: int

func _ready() -> void:
	current = total
	
	Hud.Stamina_Funcs("Set", total)
	$RegenTimer.wait_time = regen_time
	
func change(amount) -> void:
	if current + amount <= total:
		current += amount
	
	# Change Later TEMPORARY
		Hud.Stamina_Funcs("Change", amount)
		$RegenTimer.start()

func _on_regen_timer_timeout() -> void:
	change(1)
	$RegenTimer.start()
