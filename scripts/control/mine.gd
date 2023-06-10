extends Node2D

@onready
var generator = MineGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	generator.generate()
	show_blocks()

func _process(_delta):
	position.y -= $Char.global_position.y - 256

func show_blocks():
	var blocks = generator.get_blocks()
	for b in blocks:
		$Blocks.add_child(b)

func destroy_block(tile: Vector2i):
	generator.clear(tile)
	clear_blocks()
	show_blocks()
		
func clear_blocks():
	for n in $Blocks.get_children():
		$Blocks.remove_child(n)
		n.queue_free()

func can_move(position:Vector2i)->bool:
	return generator.can_move(position)
