class_name Health extends Component

signal Shield_Empty
signal ShowShield(Shield_Amount)
signal ChangeShield(Damage)

var I_Frames_enabled = false
var shield = false
var shield_amount = 0


@export var Max_Health: int
@onready var Current_Health = Max_Health

# Called when the node enters the scene tree for the first time.
#Dictionary Input
# {"Change": amount}

func work(task: Dictionary):
	if task.has("I_Frame"):
		I_Frames_enabled = task["I_Frame"]
		return

	if task.has("Change") and not I_Frames_enabled:
		# Healing
		print(shield)
		if task["Change"] < 0:
			# Do not want to heal the shield only heal the base health
			Current_Health -= task["Change"]

			if Current_Health > Max_Health:
				Current_Health = Max_Health

			health_changed()
			return

		if not shield:
			Current_Health -= task["Change"]
			health_changed()
			return
		else:
			shield_amount -= task["Change"]
			ShowShield.emit(shield_amount)
			if shield_amount < 0:
				Shield_Empty.emit()
				shield = false
			return

	#task {
	# "Shield": shield damage amount to protect from
	# }
	if task.has("Shield"):
		print("Activate Shield")
		shield = true
		shield_amount = task["Shield"]
		ShowShield.emit(task["Shield"]) # Show Shield Bar above player
		return



func health_changed():
	output.emit("Health", {"Current": Current_Health})

func _ready() -> void:
	output.emit("Health", {"Max": Max_Health})
