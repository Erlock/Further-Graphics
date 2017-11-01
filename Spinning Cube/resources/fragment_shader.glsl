#version 140

in vec3 frag_normal;	// fragment normal in world space

out vec3 colour;

in vec3 frag_position;

uniform vec3 camera;

void main()
{
	//const vec3 I_a = vec3(0.2, 0.2, 0.2);       // Ambient light intensity (and colour)

	int incidentFaces = 0;

	incidentFaces += (abs(frag_position.x) >= 0.4 ? 1 : 0);
	incidentFaces += (abs(frag_position.y) >= 0.4 ? 1 : 0);
	incidentFaces += (abs(frag_position.z) >= 0.4 ? 1 : 0);

    if(incidentFaces < 2) {
        const vec3 baseColour = vec3(0,0,1);

        vec3 l = normalize(vec3(2, 1.5, -0.5) - frag_position);
        colour = baseColour * max(dot(normalize(frag_normal), l), 0);
    } else {
        colour = vec3(0,0,0);
    }

}