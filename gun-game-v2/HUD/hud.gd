extends CanvasLayer

signal Stamina(amount)
signal change(amount)
var task_queue = []
var stamnode

func _ready():
	stamnode = Hd.get_node("Stamina")
func Stamina_Funcs(target, data):
	if target == "Set":
		stamnode._on_hud_stamina(data)
		
	if target == "Change":
		stamnode._on_hud_change(data)
		
