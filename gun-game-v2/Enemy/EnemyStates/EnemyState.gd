class_name EnemyState extends State

#Two basic states, you can add as many as you like as long as they match the node state name
const CHASE = "Chase"
const ATTACK = "Attack"
const IDLE = "Idle"

var enemy: EnemyTemplate


func _ready() -> void:
	await owner.ready
	enemy = owner as EnemyTemplate
	assert(enemy != null, "The EnemyState state type must be used only in the player scene. It needs the owner to be a Enemy node.")
