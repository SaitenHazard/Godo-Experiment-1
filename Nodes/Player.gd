extends Sprite

var coordinates : Vector2 = Vector2(0,0)
var initial_position : Vector2 = Vector2(0,0)

func _ready():
	initial_position = get_parent().get_node("GameManager")._get_initial_position();
	print(initial_position)

func _process(delta):
	_controls()
	global_position = Vector2(initial_position.x + 16*coordinates.x, initial_position.y + 16*coordinates.y)

func _controls():
	if(Input.is_action_just_released("up")):
		coordinates.y -= 1
	if(Input.is_action_just_released("down")):
		coordinates.y += 1
	if(Input.is_action_just_released("left")):
		coordinates.x -= 1	
	if(Input.is_action_just_released("right")):
		coordinates.x += 1
