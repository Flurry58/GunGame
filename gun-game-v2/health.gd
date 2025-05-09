class_name Health extends Component

@export var Max_Health: int
@onready var Current_Health = Max_Health
# Called when the node enters the scene tree for the first time.

func work(amount:Array):
	print(amount)
	Current_Health -= amount[0]
	print(Current_Health)
	
