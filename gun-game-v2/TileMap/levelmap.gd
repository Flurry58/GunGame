extends TileMapLayer
class_name LevelMap

var grid = [] # for the 2d grid

# Called when the node enters the scene tree for the first time.
func _ready():
	var dimensions = get_used_rect().size
	for y in dimensions.y:
		grid.append([])
		for x in dimensions.x:
			grid[y].append(null)

func SetObjectInGrid(position, object):
	grid[position.y][position.x] = object
	print("Grid",grid)
	
func GetObjectInGrid(position):
	return grid[position.y][position.x]
