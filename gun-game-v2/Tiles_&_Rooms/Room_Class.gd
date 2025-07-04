class_name Room extends Node

#Used in map generation
var overlapping_tilemaplayer = false

#------------------

@export var TileNode: TileMapLayer
@export var Navregion: NavigationRegion2D

var enemycount: int = 0
var roomclear = false
#Navigation Region Generation
var markscene

var Spawner_funcs = []

func _on_enimies_child_entered_tree(node: Node) -> void:
	enemycount += 1

func open_doors():
	var replace_dict = {
		Vector2i(0,7) : Vector2i(6,7),
		Vector2i(0,8) : Vector2i(6,8),
		Vector2i(1,7) : Vector2i(7,7),
		Vector2i(1,8) : Vector2i(7,8),
		Vector2i(2,7) : Vector2i(8,7),
		Vector2i(2,8) : Vector2i(8,8)
	}
	
	var TileList = TileNode.get_used_cells()
	for tile in TileList:
		var tile_atlas = TileNode.get_cell_atlas_coords(tile)
		
		if replace_dict.has(tile_atlas):
			TileNode.set_cell(tile, 0, replace_dict[tile_atlas])


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player") and roomclear == false:
		#$NavRegion.set_navigation_layers(1)
		for funcs in Spawner_funcs:
			funcs.call()
		var replace_dict = {
			Vector2i(6,7) : Vector2i(0,7),
			Vector2i(6,8) : Vector2i(0,8),
			Vector2i(7,7) : Vector2i(1,7),
			Vector2i(7,8) : Vector2i(1,8),
			Vector2i(8,7) : Vector2i(2,7),
			Vector2i(8,8) : Vector2i(2,8)
		}
		
		var TileList = TileNode.get_used_cells()
		for tile in TileList:
			var tile_atlas = TileNode.get_cell_atlas_coords(tile)
			
			if replace_dict.has(tile_atlas):
				TileNode.set_cell(tile, 0, replace_dict[tile_atlas])
				
func _on_enimies_enemey_dead() -> void:
	enemycount -= 1
	if enemycount == 0:
		

		roomclear = true
		
		open_doors()


func _on_enimies_ready() -> void:
	for Spawner in $Enimies.get_children():
		Spawner_funcs.append(Callable(Spawner, "_on_enimies_spawn_enemies"))

func check_area_ready()->bool:
	await $TileGenCollision.physics_loaded
	return len($TileGenCollision.get_overlapping_areas())
