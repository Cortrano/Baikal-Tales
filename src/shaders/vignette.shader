shader_type canvas_item;

uniform sampler2D vignette;
const vec3 noise_magic = vec3(0.06711056, 0.00583715, 52.9829189);
uniform float debanding_dither;
uniform float blur = 0.5;
uniform float vignette_darkness = -0.05;

void fragment() {
	vec3 vignette_color = texture(vignette, UV).rgb;
	
	COLOR.rgb = textureLod(SCREEN_TEXTURE, SCREEN_UV, (blur - vignette_color.r) * 4.0).rgb;
	COLOR.rgb *= texture(vignette, UV).rgb;
	COLOR.rgb += vignette_darkness;
	
	float offset =  fract(noise_magic.z * fract(dot(FRAGCOORD.xy, noise_magic.xy)));
	COLOR.rgb += vec3(offset, 1.0 - offset, offset) * debanding_dither;
}