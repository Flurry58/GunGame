extends Node2D


#Just functions to connect signals for the guns so they can access the ammo ui
func connect_ammo_update(sig):
	sig.connect(self.get_node("Canvas/Container/GridContainer").update_ammo)
	
func connect_change_weapon(sig):
	sig.connect(self.get_node("Canvas/Container/GridContainer").changed_weapon)

func connect_use_ammo(sig):
	sig.connect(self.get_node("Canvas/Container/GridContainer").use_ammo)
	
