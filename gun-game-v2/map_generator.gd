extends Node2D


var rooms = [preload("res://Tiles_&_Rooms/room_34.tscn"), preload("res://Tiles_&_Rooms/room_2.tscn")]

var rng = RandomNumberGenerator.new()

@export var number_of_rooms: int = 15
@export var attempt_limit: int = 20
@export var tile_size: int = 16

var start_pos = 0
func _ready() -> void:
	for room in range(number_of_rooms):
		var room_to_place = rooms[rng.randi_range(0, len(rooms)-1)].instantiate()
		var placed = false
		var attempt = 0 #Stop at 50
		
		
		while not placed and attempt < attempt_limit:
			var valid_16_position = true
			var random_position = Vector2(rng.randi_range(0, 1152.0), rng.randi_range(0, 648))
			random_position = SnapTo16Grid(random_position)
				
			add_child(room_to_place)
			room_to_place.position = random_position
			var is_overlapping_room = await room_to_place.check_area_ready()
			if !is_overlapping_room:
				placed = true
			else:
				attempt += 1
		
		if attempt >= attempt_limit:
			remove_child(room_to_place)
			room_to_place.queue_free()
	
		
func SnapTo16Grid(InputCoord: Vector2):
	InputCoord.x = floor(InputCoord.x/tile_size)*tile_size
	InputCoord.y = floor(InputCoord.y/tile_size)*tile_size
	return InputCoord
