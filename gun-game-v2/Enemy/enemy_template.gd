class_name EnemyTemplate extends CharacterBody2D
signal set_health(data: Dictionary)

@onready var Mediator = $Mediator
@onready var player = get_tree().get_nodes_in_group("Player")[0]
@onready var nav = $NavigationAgent2D


@export var Damage_Amount: int
@export var lineofsight: bool
@export var chase_length: float
@export var speed: float
@export var health: int


@export var SpriteNode: AnimatedSprite2D

@onready var sight_ray = $sight
var raycast: RayCast2D
var direction : Vector2
var playerinsight = true

var start_ai = false
func _on_mediator_child_output(child_name: String, data: Dictionary) -> void:
	pass # Replace with function body.


#Line of Sight Calculations
func _ready() -> void:
	raycast = RayCast2D.new()
	self.add_child(raycast)
	sight_ray.target_position = to_local(player.position)

	
	
func move_to_target(target_pos) -> void:
	set_movement_target(target_pos)

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = nav.get_next_path_position()
	
	var new_velocity = current_agent_position.direction_to(next_path_position) *speed
	
	if nav.avoidance_enabled:
		nav.set_velocity(new_velocity)
	else:
		_velocity_computed(new_velocity)

	move_and_slide()
	
func _velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	
func set_movement_target(movement_target: Vector2):
	nav.target_position = movement_target


#The AI begins to attack the player after the AI start timer is finished, this ensures the ai don't just rush the player
#into submission instantly and gives the player some time to breath in each room
func _on_ai_start_timeout() -> void:
	start_ai = true
