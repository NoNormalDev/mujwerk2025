shader_type spatial;

uniform sampler2D tex;
uniform sampler2D arm;

void fragment() {
	ALBEDO = texture(tex,UV).rgb;
	vec4 armuv = texture(arm,UV);
	ROUGHNESS = armuv.g;
	METALLIC = armuv.b;
}
