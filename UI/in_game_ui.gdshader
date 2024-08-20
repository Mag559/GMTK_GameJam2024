shader_type canvas_item;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform vec2 origin = vec2(0.47, 0.7);
uniform float progress : hint_range(0.0, 100.0, 0.1);


void fragment() {
	COLOR = textureLod(screen_texture, SCREEN_UV, 0.0);
	float dist2 = (UV.x - origin.x) * (UV.x - origin.x) + (UV.y - origin.y) * (UV.y - origin.y);
	if (1.0 / dist2 < progress) {
		COLOR.rgb *= -1.0 / (1.0 / dist2 - progress - 1.0);
	} 
}