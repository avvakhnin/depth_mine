extends Node2D



const BLOCKS = [
	preload("res://scenes/block_1.tscn"),
	preload("res://scenes/block_2.tscn"),
	preload("res://scenes/block_3.tscn"),
	preload("res://scenes/block_4.tscn"),
	preload("res://scenes/block_5.tscn"),
]




var field : CubeField
# Called when the node enters the scene tree for the first time.
func _ready():
	generate_field()
	show_field()


func generate_field():
	field = CubeField.new()
	for i in 20:
		var line = []
		field.new_line()
		for j in mine_utils.LINE_BLOCK_COUNT:
			field.add_block(randi_range(0,4))
			

func show_field():
	var vertical_offset = field.vertical_offset
	for line in field .lines:
		var block_num = 0
		for block_type in line.cubes:
			if block_type >= BLOCKS.size():
				block_num +=1
				continue
			var block = BLOCKS[block_type].instantiate() as Node2D
			block.position = mine_utils.get_pos(block_num, vertical_offset)
			$Blocks.add_child(block)
			block_num +=1
		vertical_offset +=1
	
	
func _process(_delta):
	position.y -= $Char.global_position.y - 256
