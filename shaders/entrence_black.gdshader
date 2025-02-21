shader_type spatial;
render_mode cull_back, blend_mix;

void fragment() {
	ALBEDO = vec3(0.0,0.0,0.0);
	ROUGHNESS = 1.0;
	SPECULAR = 0.0;
	METALLIC = 0.0;
}
