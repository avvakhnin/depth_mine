extends Node
class_name MineGenerator

const FIELD_COUNT = 4

const BLOCKS = [
	preload("res://scenes/block_1.tscn"),
	preload("res://scenes/block_2.tscn"),
	preload("res://scenes/block_3.tscn"),
	preload("res://scenes/block_4.tscn"),
	preload("res://scenes/block_5.tscn"),
]

var field : CubeField

func _init():
	pass

func generate():
	field = CubeField.new()
	for i in FIELD_COUNT:
		var line = []
		field.new_line()
		for j in mine_utils.LINE_BLOCK_COUNT:
			field.add_block(randi_range(0,4))

func clear(tile: Vector2i):
	field.clear(tile)

func get_blocks()-> Array[Node2D]:
	var blocks:Array[Node2D]
	var vertical_offset = field.vertical_offset
	for line in field.lines:
		var block_num = 0
		for block_type in line.cubes:
			if block_type >= BLOCKS.size():
				block_num +=1
				continue
			var block = BLOCKS[block_type].instantiate() as Node2D
			block.position = mine_utils.get_pos(block_num, vertical_offset)
			blocks.append(block)
			block_num +=1
		vertical_offset +=1
	return blocks
	
func can_move(position: Vector2i)-> bool:
	return field.is_busy(position)
