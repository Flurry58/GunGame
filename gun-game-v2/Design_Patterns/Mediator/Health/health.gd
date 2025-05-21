class_name Health extends Component

var process_work = true

@export var Max_Health: int
@onready var Current_Health = Max_Health

# Called when the node enters the scene tree for the first time.
signal output(my_name: String, data:Array)


func work(amount:Array):
	if len(amount) == 2:
		process_work = amount[1]
		return
		
	if process_work and len(amount) == 1:
		Current_Health -= amount[0]
		health_changed()
	

func health_changed():
	output.emit("Health", [Current_Health])
