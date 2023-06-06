extends Node

func _ready():
	print(mine_utils.get_tile(Vector2i(0,0)))
	print(mine_utils.get_tile(Vector2i(1,1)))
	print(mine_utils.get_tile(Vector2i(63,63)))
	print(mine_utils.get_tile(Vector2i(64,64)))
	print(mine_utils.get_tile(Vector2i(65,65)))
