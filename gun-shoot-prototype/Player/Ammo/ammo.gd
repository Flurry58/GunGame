extends Container

var ammo_texture
var ammo_list = []


var emptyPath = load("res://Player/Ammo/empty.png")
var fullPath = load("res://Player/Ammo/full.png")
var cols
var maxs = 5
var re = 5

func changed_weapon(Max_A, Recharge) -> void:
	for n in ammo_list:
		self.remove_child(n)
		n.queue_free() 
		
	ammo_list = []
	
	for i in range(Max_A):
		var bullet = TextureRect.new()
		bullet.texture = fullPath	
		ammo_list.append(bullet)
		self.add_child(bullet)
		
func use_ammo(current_ammo, amount):
	for i in range(amount):
		ammo_list[current_ammo-1].texture = emptyPath

func update_ammo(current_ammo, Maxammo):
	ammo_list[current_ammo-1].texture = fullPath
	for i in range(current_ammo, Maxammo):
		ammo_list[i].texture = emptyPath
		#Reset ammo not available to emptyimage, this needs to be fixed and is a clunky solution
