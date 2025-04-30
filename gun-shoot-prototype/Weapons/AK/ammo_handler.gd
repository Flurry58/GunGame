extends Node

class_name Ammo_Handler

signal changed_weapon(Max_Ammo, Recharge_Rate)
signal update_ammo(current_ammo, Max_Ammo)
signal send_use_ammo(current_ammo, amount)

@export var Max_Ammo: int
@export var Recharge_Rate: float
var current_ammo = Max_Ammo

var timer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var level_root = get_parent().get_parent().get_parent()
	level_root.connect_ammo_update(update_ammo)
	level_root.connect_change_weapon(changed_weapon)
	level_root.connect_use_ammo(send_use_ammo)
	
	current_ammo = Max_Ammo
	timer = Timer.new()
	timer.timeout.connect(_on_timer_timeout)
	timer.one_shot = true
	self.add_child(timer)
	#FunctionLibrary.changed_weapon(Max_Ammo, Recharge_Rate)
	
	
	changed_weapon.emit(Max_Ammo, Recharge_Rate)

func _process(delta):
	update_ammo.emit(current_ammo, Max_Ammo)
	#FunctionLibrary.update_ammo(current_ammo, Max_Ammo)

func use_ammo(amount):
	send_use_ammo.emit(current_ammo, amount)
	
	current_ammo -= amount
	timer.start()

func _on_timer_timeout() -> void:
	current_ammo = current_ammo + 1
	if current_ammo < Max_Ammo:
		timer.start()

func pause_reload():
	if timer:
		timer.set_paused(true)
	
	
func resume_reload():
	changed_weapon.emit(Max_Ammo, Recharge_Rate)

	update_ammo.emit(current_ammo, Max_Ammo)

	if timer:
		timer.set_paused(false)
