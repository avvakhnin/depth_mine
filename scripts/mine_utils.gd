extends Node
class_name mine_utils

const BLOCK_WIDTH = 64
const BLOCK_HEIGHT = 64
const BLOCK_POSITION_OFFSET = Vector2(BLOCK_WIDTH,BLOCK_HEIGHT)
const BLOCK_POSITION_OFFSET_I = Vector2i(BLOCK_WIDTH,BLOCK_HEIGHT)

const LINE_BLOCK_COUNT = 10


static func get_tile(pos:Vector2) -> Vector2i:
	return pos/BLOCK_POSITION_OFFSET


static func get_pos(x:int, y:int) -> Vector2:
	return Vector2(x*BLOCK_WIDTH, y*BLOCK_HEIGHT)


static func get_posv(tile:Vector2i) -> Vector2:
	return tile*BLOCK_POSITION_OFFSET_I
