extends CharacterBody2D

class_name Play


var direction : Vector2 = Vector2.ZERO


const move_speed : float = 500


var curgun = false
var shooting


@onready var animatedsprite = $AnimatedSprite2D
@onready var movement_manager = $Movement_Manager

#Very simple state machine, right now only two states available, idle and shoot
var state = "idle"

var equipedgun_scene
var equipedgun


var slot_gun1
var slot_gun2

var inventory_not_equiped = []

var akholder = preload("res://Weapons/AK/AK.tscn")
var pistolholder = preload("res://Weapons/Pistol/pistol.tscn")

var gun1
var gun2


## A value between 0.0 and [code]acceleration_time[/code]. How far along the
## easing curve are you?


func _ready() -> void:
	slot_gun1 = akholder.instantiate()
	slot_gun2 = pistolholder.instantiate()
	slot_gun2.put_away()
	equipedgun = slot_gun1
	self.add_child(equipedgun) #add gun to player object
	
	inventory_not_equiped = [slot_gun2]


func change_gun(current, target):
	print(target)
	print(inventory_not_equiped)
	if target in inventory_not_equiped:
		self.remove_child(current)
		current.put_away()
		target.take_out()
		self.add_child(target)
		inventory_not_equiped = [current]
		return target
		
	return current
	

func _process(delta:float) -> void:
	shooting = Input.get_action_strength("shoot")
	
	gun1 = Input.get_action_strength("Slot_1")
	gun2 = Input.get_action_strength("Slot_2")

	if not shooting:
		
		if gun1:
			equipedgun = change_gun(equipedgun, slot_gun2)
			#if equipedgun != slot_gun2:
		#		self.remove_child(equipedgun)
		#		equipedgun.put_away()
		#		equipedgun = slot_gun2
		#		equipedgun.take_out()
		#		self.add_child(equipedgun)
		elif gun2:
			equipedgun = change_gun(equipedgun, slot_gun1)
			#if equipedgun != slot_gun1:
		#		self.remove_child(equipedgun)
		#		equipedgun.put_away()
		#		equipedgun = slot_gun1
		#		equipedgun.take_out()
		#		self.add_child(equipedgun)
			
	UpdateAnimation()

	if shooting:
		shootgun()
	else:
		velocity = movement_manager.calculate_movement(delta)
	
	
	
func shootgun():
	if state != 'shoot':
		equipedgun.enter_state(rotation)
		state = "shoot"


#Simple physics process, the output is the velocity of the character when shooting the gun it has equiped
func _physics_process(delta):
	if state == 'shoot':
		velocity = equipedgun.gun_recoil(velocity, delta) #just grab the velocity the gun calculates
		move_and_slide()
	else:
		move()

#Moving normally, not shooting
func move():
	look_at(get_global_mouse_position())
	
	move_and_slide()

func UpdateAnimation() -> void:
	pass
	#animatedsprite.play(state)

func change_state(newstate, boolexpres):
	if boolexpres:
		state = newstate
