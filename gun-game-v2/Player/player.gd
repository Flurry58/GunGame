class_name Player extends CharacterBody2D

@export var speed := 200.0
@onready var Mediator = $Mediator

@export var Equipped_Guns : Array[Gun]#Max of 3 guns 

@onready var current_gun = Equipped_Guns[0]
@onready var Animator = $Animation

signal send_velocity(data:Vector2)


var main_scene

func swap_start(index) -> void:
	current_gun.pause_ammo_regen()
	current_gun.visible = false
	
	current_gun = Equipped_Guns[index]
	current_gun.visible = true
	current_gun.resume_ammo_regen()
	current_gun.change_ammo()
func _ready() -> void:
	await owner.ready
	main_scene = owner
	swap_start(1)
	swap_start(0)



func _on_mediator_child_output(child_name: String, data: Array) -> void:
	if child_name == "Health" and data[0] == 0:
		Hud.GameOver()
		
