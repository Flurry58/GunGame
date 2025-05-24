extends PlayerState

#Enter then swap equiped gun, while doing this pause the ammo regen timer for the current gun and hide it. Then 
#we need to manually set the hud stamina to the current ammo amount of the new gun
func enter(previous_state_path: String, data := {}) -> void:
	data["Current"].pause_ammo_regen()
	data["Current"].visible = false
	
	player.current_gun = player.Equipped_Guns[data["Gun"]]
	player.current_gun.visible = true
	player.current_gun.resume_ammo_regen()
	player.current_gun.change_ammo()

	finished.emit(INPUT)
	
