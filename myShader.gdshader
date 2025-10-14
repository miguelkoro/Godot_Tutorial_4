shader_type canvas_item;

uniform vec4 tint_color: source_color = vec4(1.0,1.0,1.0,1.0);
uniform float amplitude = 0.05;
uniform float frequency = 20;
uniform float speed = 2.0;

void vertex() {
	VERTEX.y += sin(VERTEX.x * frequency + TIME * speed) * amplitude;
}

void fragment() {
	vec2 uv = UV;
	uv.y += sin(uv.x * frequency * TIME * speed) * amplitude;
	vec4 tex_color = texture(TEXTURE,UV);
	//COLOR = vec4(1,1,1,1);
	//COLOR = vec4(1.0 - tex_color.rgb, tex_color.a);
	COLOR = texture(TEXTURE,uv);
	//COLOR=tex_color * tint_color;
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
