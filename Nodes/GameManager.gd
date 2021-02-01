extends Node

var tile = load("res://Nodes/Tile.tscn");
export var initial_position : Vector2 = Vector2(144,80)
export var size : Vector2 = Vector2(15,10)

func _ready():
	_make_map()

func _make_map():
	for x in range(0, size.x):
		for y in range (0, size.y):
			var temp = tile.instance()
			temp.global_position = Vector2(initial_position.x + x*16 , initial_position.y + y*16)
			if(x == 0 && y == 0):
				print(temp.global_position)
			add_child(temp)

func _get_initial_position():
	return initial_position
	
