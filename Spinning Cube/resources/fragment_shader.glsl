#version 140

in vec3 frag_normal;	// fragment normal in world space

out vec3 colour;

in vec3 frag_position;

uniform vec3 camera;

void main()
{
	//const vec3 I_a = vec3(0.2, 0.2, 0.2);       // Ambient light intensity (and colour)
	const vec3 I_a = vec3(0,0,1);

	const float k_d = 0.8;                      // Diffuse light factor
    vec3 C_diff = vec3(0.560, 0.525, 0.478);    // Diffuse light colour

    vec3 C_spec = vec3(1, 1, 1);
    const float k_s = 0.8;
    const float alpha = 10;
    vec3 C_snow = vec3(1,1,1);

	const vec3 I = vec3(0.941, 0.968, 1);   // Light intensity (and colour)
	vec3 L = normalize(vec3(2, 1.5, -0.5)); // The light direction as a unit vector
	vec3 N = normalize(frag_normal); // Normal in world coordinates

	vec3 V = normalize(camera - frag_position);
	vec3 R = normalize(2*dot(N, L)*N - L);


    colour = C_diff*I_a;

    if(frag_position.y > 1.5) {
        //if(dot(N, L) > 0)
            colour += C_snow*k_d*I*max(0, dot(N, L));
        //if(dot(R, V) > 0)
            colour += C_spec*k_s*I*pow(max(0, dot(R, V)), alpha);
    } else {
        colour += C_diff*k_d*I*max(0, dot(N, L));
    }
    //colour = abs(frag_normal);

}