class_name Health extends Component

@export var Max_Health: int
@onready var Current_Health = Max_Health
# Called when the node enters the scene tree for the first time.
signal output(my_name: String, data:Array)

func work(amount:Array):
	Current_Health -= amount[0]
	health_changed()

func health_changed():
	output.emit("Health", [Current_Health])
