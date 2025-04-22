extends CharacterBody2D

class_name Play


var direction : Vector2 = Vector2.ZERO


const move_speed : float = 500


var curgun = false
var shooting


@onready var animatedsprite = $AnimatedSprite2D

#Very simple state machine, right now only two states available, idle and shoot
var state = "idle"

var equipedgun_scene
var equipedgun

## A value between 0.0 and [code]acceleration_time[/code]. How far along the
## easing curve are you?


func _ready() -> void:
	equipedgun_scene = preload("res://Weapons/Pistol/gun.tscn") #pre load gun object
	equipedgun = equipedgun_scene.instantiate()
	self.add_child(equipedgun) #add gun to player object
	
func _direction() -> Vector2:
	return Input.get_vector("left", "right", "up", "down")
	
func _process(delta:float) -> void:
	shooting = Input.get_action_strength("shoot")
	velocity = _direction() * move_speed
	
	UpdateAnimation()

	if shooting:
		shootgun()
	
	
	
func shootgun():

	if state != 'shoot':
		equipedgun.enter_state(rotation)
		state = "shoot"


#Simple physics process, the output is the velocity of the character when shooting the gun it has equiped
func _physics_process(delta):
	if state == 'shoot':
		var output = equipedgun.gun_recoil(velocity, delta)

		velocity = output
			
		move_and_slide()
	else:
		move()


#Moving normally, not shooting
func move():
	look_at(get_global_mouse_position())
	
	move_and_slide()

#Turn character

	

	
func UpdateAnimation() -> void:
	pass
	#animatedsprite.play(state)




func change_state(newstate, boolexpres):
	if boolexpres:
		state = newstate
