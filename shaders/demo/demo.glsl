uniform vec2 resolution;
uniform vec4 mouse;
uniform float time;


void main(){ 
 
	float x = gl_FragCoord.x;
	float y = gl_FragCoord.y;
	float w = resolution.x;
	float h = resolution.y;

	gl_FragColor = vec4((sin(time)+1.0)/2.0,x/w,y/h,1);
}