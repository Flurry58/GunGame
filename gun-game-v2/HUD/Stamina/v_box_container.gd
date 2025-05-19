extends VBoxContainer

var total: int
var current: int
var texture_rect_list = []
var bullet_scene



func _ready() -> void:
	bullet_scene = preload("res://HUD/Stamina/Bullet_Stamina.tscn")
	
	
func _on_hud_stamina(amount: Variant) -> void:
	print("Recieved")

	
	for node in texture_rect_list:
		node.queue_free()
		
	texture_rect_list = [] #Clear list and repopulate it with the amount of bullets we need
	for i in range(amount):
		var tempscene = bullet_scene.instantiate()
		texture_rect_list.append(tempscene)
		add_child(tempscene)

	total = amount
	current = total
		

func _on_hud_change(amount: Variant) -> void:
	if (current + amount) <= total:
		current += amount
		for i in range(0, total):
			if i < current:
				texture_rect_list[i].visible = true
			else:
				texture_rect_list[i].visible = false
		
