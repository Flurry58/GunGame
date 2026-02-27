extends Area2D

signal physics_loaded(collisions)

var sent_sign = 0

func _physics_process(delta: float) -> void:
	if sent_sign >= 3 and sent_sign < 4:
		physics_loaded.emit(len(self.get_overlapping_areas()))
		sent_sign = 0
	sent_sign += 1
