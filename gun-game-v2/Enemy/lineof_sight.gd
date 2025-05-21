extends Node2D

var verlist = [Vector2(0,1),Vector2(1,1),Vector2(1,0),Vector2(1,-1),Vector2(0,-1),Vector2(-1,-1),Vector2(-1,0),Vector2(-1,1)]
var children_rays
func _ready() -> void:
	children_rays = self.get_children()
	
func get_collisions():
	var output = []
	for i in range(len(children_rays)):
		if "FloorWall" in str(children_rays[i].get_collider()):
			return verlist[i]
			output.append(children_rays[i].get_collider())
		else:
			output.append(null)
	
	
	return null
