extends Room

signal spawn_enemies

var enemycount: int = 0
var roomclear = false
#Navigation Region Generation
var markscene

var Spawner_funcs = []

func _ready() -> void:
	for Spawner in $Enimies.get_children():
		Spawner_funcs.append(Callable(Spawner, "_on_enimies_spawn_enemies"))
	#get_all_tile_physics()


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
		
		
func _on_enimies_child_entered_tree(node: Node) -> void:
	enemycount += 1



func get_all_tile_physics():
	markscene = preload("res://DebugScenes/DebugMark.tscn")
	var averageloc: Vector2 = Vector2(0,0)
	var edge_list = []
	var TileList = TileNode.get_used_cells()
	for tile in TileList:
		var test = TileNode.get_cell_tile_data(tile)
		var tile_center_pos = TileNode.map_to_local(tile)
		averageloc += tile_center_pos
		if len(test.get_collision_polygon_points(0,0)):
			var point = Vector2(int(tile_center_pos.x /1.2), int(tile_center_pos.y /1.2))
			edge_list.append(Vector2(int(tile_center_pos.x /1.2), int(tile_center_pos.y /1.2)))
			#addmark(markscene, point)
			edge_list.append(tile_center_pos)
	#CreatePolygon(edge_list)
	
#Needs to be ironed out
func CreatePolygon(edgelist):
	var new_navigation_mesh = NavigationPolygon.new()
	var bounding_outline = PackedVector2Array(edgelist)
	new_navigation_mesh.add_outline(bounding_outline)
	NavigationServer2D.bake_from_source_geometry_data(new_navigation_mesh, NavigationMeshSourceGeometryData2D.new());
	$NavRegion.navigation_polygon = new_navigation_mesh
	
func addmark(markscene, tile_center_pos):
	var temp = markscene.instantiate()
	#print(tile_center_pos)
	temp.position = tile_center_pos
	self.add_child(temp)


func _on_enimies_enemey_dead() -> void:
	enemycount -= 1
	if enemycount == 0:
		roomclear = true
		open_doors()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group("Player") and roomclear == false:
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
