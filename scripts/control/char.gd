extends Sprite2D


const SPEED = 300.0


var is_moving = false
var target_point: Vector2

func _process(delta):
		
	if is_moving :
		position = position.move_toward(target_point, delta*SPEED)
		if position == target_point:
			is_moving = false
		return

	var direction = _choose_direction()
	if direction != Vector2i.ZERO:
		accept_moving(direction)
		
	if !is_moving:
		accept_fire()
	
	
		
		

func _choose_direction() -> Vector2i:
	var position_i = mine_utils.get_tile(position)

	var side_direction = Vector2i(sign(Input.get_axis("ui_left", "ui_right")),0)
	
	if side_direction != Vector2i.ZERO:
		if (!$"..".field.is_busy(position_i + side_direction) )&& \
			($"..".field.is_busy(position_i  + Vector2i.DOWN ) \
			|| $"..".field.is_busy(position_i + side_direction + Vector2i.DOWN ) ):
			return side_direction
		
	var botton_tile = mine_utils.get_tile(position) + Vector2i.DOWN
	if !$"..".field.is_busy(botton_tile):
		return Vector2i.DOWN
		
	if Input.is_action_just_pressed("ui_up"):
		var up_tile = mine_utils.get_tile(position) + Vector2i.UP
		if !$"..".field.is_busy(up_tile):
			return Vector2i.UP
			
	return Vector2i.ZERO


func accept_moving(direction:Vector2i):
	var target_point_i = mine_utils.get_tile(position) + direction
	target_point = mine_utils.get_posv(target_point_i)
	is_moving = true


func accept_fire():
	if Input.is_action_just_pressed("ui_accept"):
		var fire_tile
		var fire_direct = sign(Input.get_axis("ui_left", "ui_right"))
		if fire_direct == 0:
			fire_tile = Vector2i.DOWN +  mine_utils.get_tile(position)
		else:
			fire_tile = Vector2i(fire_direct,0) +  mine_utils.get_tile(position)
		$"..".field.clear(fire_tile)
		for n in $"../Blocks".get_children():
			$"../Blocks".remove_child(n)
			n.queue_free()
		$"..".show_field()
