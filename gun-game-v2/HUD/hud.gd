extends CanvasLayer

signal Stamina(amount)
signal change(amount)
var task_queue = []


var stamnode
var gameover
func _ready():
	stamnode = Hd.get_node("Stamina")
	gameover = Hd.get_node("GameOver")
func Stamina_Funcs(target, data):
	if target == "Set":
		stamnode._on_hud_stamina(data)
		
	if target == "Change":
		stamnode._on_hud_change(data)
		
func GameOver() -> void:
	gameover.visible = true
	get_tree().paused = true
		
