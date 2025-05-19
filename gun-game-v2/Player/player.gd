class_name Player extends CharacterBody2D

@export var speed := 200.0
@onready var Mediator = $Mediator

@export var Equipped_Guns : Array[Gun]#Max of 3 guns 

@onready var current_gun = Equipped_Guns[0]
@onready var Animator = $Animation

signal send_velocity(data:Vector2)

var Health
var main_scene

func _ready() -> void:
	await owner.ready
	main_scene = owner
	Health = $Health


func _on_mediator_child_output(child_name: String, data: Array) -> void:
	pass
		
