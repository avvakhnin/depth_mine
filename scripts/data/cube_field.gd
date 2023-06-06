extends Node
class_name CubeField

var vertical_offset = 0 
var lines:Array[CubeLine]

func new_line():
	lines.append(CubeLine.new())
	

func add_line(_cubes:Array[int]):
	lines.append(CubeLine.new(_cubes))


func add_block( block_type:int):
	lines.back().cubes.append(block_type)

func is_busy(tile:Vector2i) -> bool:
	return get_type(tile)<5


func clear(tile:Vector2i):
	var figure : Array[Vector2i]
	var t = get_type(tile) 
	if t >= 0 && t < 5:
		collect_figure(figure, tile, t)
	for _tile in figure:
		lines[_tile.y].cubes[_tile.x] = 5

func collect_figure(figure : Array[Vector2i], tile:Vector2i, block_type:int):
	if tile in figure:
		return
	var t = get_type(tile) 
	if t != block_type:
		return	
	figure.append(tile)
	collect_figure(figure, tile + Vector2i.DOWN, block_type)
	collect_figure(figure, tile + Vector2i.UP, block_type)
	collect_figure(figure, tile + Vector2i.LEFT, block_type)
	collect_figure(figure, tile + Vector2i.RIGHT, block_type)

func get_type(tile:Vector2i) -> int:
	if tile.x < 0 || tile.x >= mine_utils.LINE_BLOCK_COUNT :
		return -1
	var line_num = tile.y - vertical_offset
	if line_num >= lines.size():
		return -1
	if line_num < 0  :
		return 1000
	var line = lines[line_num]
	return line.cubes[tile.x]
