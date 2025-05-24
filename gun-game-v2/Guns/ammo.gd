class_name Ammo extends Node

@export var total: int
@export var regen_time: float
@export var regen_amount: int


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

func set_ammo_manually() -> void:
	Hud.Stamina_Funcs("Set", total)
	Hud.Stamina_Funcs("Change", -1 * (total - current))

func exit_gun() -> void:
	$RegenTimer.stop()

func _on_regen_timer_timeout() -> void:
	change(regen_amount)
	$RegenTimer.start()
	
func regen_pause() -> void:
	$RegenTimer.stop()
	
func resume_regen() -> void:
	$RegenTimer.start()
