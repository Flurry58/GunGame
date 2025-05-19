class_name AnimationState extends State

const UP = "Up"
const DOWN = "Down"
const LEFT = "Left"
const RIGHT = "Right"

var AniSprite: AnimatedSprite2D

func _ready() -> void:
	await owner.ready
	AniSprite = self.get_parent().get_parent()

	
