shader_type canvas_item;

uniform vec4 block_color:source_color;

void fragment() {
	COLOR = block_color;
}
