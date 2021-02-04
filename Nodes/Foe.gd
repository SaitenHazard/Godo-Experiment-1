extends Sprite

var target = load("res://Nodes/Target.tscn");
var initial_position : Vector2 = Vector2(0,5)
var size
var targets = []

export var coordinates : Vector2 = Vector2(5,5)
export var attack_range : int = 3
	
var count : int = 0;

func _ready():
	var count_sides = 4
	initial_position = get_parent().get_node("GameManager")._get_initial_position();
	size = get_parent().get_node("GameManager")._get_map_size();
	_spawn_target(attack_range * count_sides + 1)
	
func _process(delta):
	_controls()
	global_position = Vector2(initial_position.x + 16*coordinates.x, initial_position.y + 16*coordinates.y)
	_position_target()
	for x in range(0, attack_range):
		if count < attack_range:
			count+=1

func _position_target():
	var index = 0;
	targets[index].global_position = Vector2(coordinates.x, coordinates.y)
	index+=1
	for x in range(0, attack_range):
		targets[index].global_position = Vector2(coordinates.x + 16*x, coordinates.y)
		index+=1
		targets[index].global_position = Vector2(coordinates.x, coordinates.y + 16*x)
		index+=1
		targets[index].global_position = Vector2(coordinates.x - 16*x, coordinates.y)
		index+=1
		targets[index].global_position = Vector2(coordinates.x, coordinates.y - 16*x)
		index+=1

func _spawn_target(var count):
	print(count)
	for x in range(0, count):
		var temp = target.instance()
		targets.push_back(temp)
		add_child(temp)

func _get_map_position()
	pass

func _controls():
	pass
