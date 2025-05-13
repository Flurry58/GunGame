extends Node2D

@onready var children = self.get_children()
func request_raycast_collision_update() -> Array:
	var output_array = [0,0,0,0,0,0,0,0]

	#Loop through the children then get the danger level from the tile map, depending on the danger level adjust the output array
	#accordingly
	for N in range(len(children)):
	
		if children[N].get_collider() is LevelMap:
			output_array[N] = get_tile_danger_level(children[N])
			if danger_repeat_test(N-1, output_array):
				output_array[(N-1)%len(children)] = floor(output_array[N] / 2)
			if danger_repeat_test(N+1, output_array):
				output_array[(N+1)%len(children)] = floor(output_array[N] / 2)
	print(output_array)
	return output_array

func danger_repeat_test(N, output_array, target_val=5): #In godot lambda is weird so this worked better
	return output_array[(N)%len(children)] != target_val
	
func get_tile_danger_level(N):
	var collider = N.get_collider()
	var tile_rid = N.get_collider_rid()
	var tile_world_coords = collider.get_coords_for_body_rid(tile_rid)
	var tile_atlas_coords = collider.get_cell_atlas_coords(tile_world_coords)
	var tile_source_id = collider.get_cell_source_id(tile_world_coords)
	var tile_source = collider.tile_set.get_source(tile_source_id)
	return tile_source.get_tile_data(tile_atlas_coords, 0).get_custom_data("Danger_Level")


func color_ray(Index: int):
	var target = children[Index]
	target.modulate = Color("LIME")
	
	for i in range(len(children)):
		if i != Index:
			children[i].modulate = Color("LIGHT_STEEL_BLUE")
	
	
