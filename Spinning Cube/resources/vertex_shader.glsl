#version 140

in vec3 position;		// vertex position in local space
in vec3 normal;			// vertex normal in local space

out vec3 frag_normal;	// fragment normal in world space
out vec3 frag_position;

uniform mat4 mvp_matrix; // model-view-projection matrix

//uniform mat3 rotationMatrix;

uniform float angle;

mat3 rotationMatrix = mat3(vec3(cos(angle), 0, -sin(angle)), vec3(0,1,0), vec3(sin(angle), 0, cos(angle)));

void main()
{
    // Typicaly normal is transformed by the model matrix
    // Since the model matrix is identity in our case, we do not modify normals
    frag_normal = normal*rotationMatrix;
//  frag_normal = normal;

    frag_position = position;

    // The position is projected to the screen coordinates using mvp_matrix
	gl_Position = mvp_matrix * vec4(position * rotationMatrix, 1.0);
//	gl_Position = mvp_matrix * vec4(position, 1.0);
}