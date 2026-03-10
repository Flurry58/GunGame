class_name Health extends Component

var I_Frames_enabled = false

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
		Current_Health -= task["Change"]
		health_changed()


func health_changed():
	output.emit("Health", {"Current": Current_Health})

func _ready() -> void:
	output.emit("Health", {"Max": Max_Health})
