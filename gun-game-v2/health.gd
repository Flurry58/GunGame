class_name Health extends Component

@export var Max_Health: int
@onready var Current_Health = Max_Health
# Called when the node enters the scene tree for the first time.

func work(amount:Array):
<<<<<<< Updated upstream:gun-game-v2/health.gd
	print(amount)
=======
	print("health edit", amount)
>>>>>>> Stashed changes:gun-game-v2/Design_Patterns/Mediator/health.gd
	Current_Health -= amount[0]
	print(Current_Health)
	
