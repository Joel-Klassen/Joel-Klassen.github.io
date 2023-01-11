uniform vec2 resolution;
uniform vec4 mouse;
uniform float time;

uniform sampler2D texture;

int frameBuffer;


void main(){ 
 
	// Create a framebuffer
    frameBuffer = gl.createFramebuffer();
    gl.bindFramebuffer(gl.FRAMEBUFFER, frameBuffer);
 
    // Attach a texture to it.
    gl.framebufferTexture2D(
        gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture, 0);

	float x = gl_FragCoord.x;
	float y = gl_FragCoord.y;
	float w = resolution.x;
	float h = resolution.y;

	vec2 uv = vec2(x/w, y/h);
 
	float right = texture2D(texture, uv + vec2(1.0/w, 0)).r;
	float up = texture2D(texture, uv + vec2(0, 1.0/h)).r;

	var fb = gl.createFramebuffer();

	float c =1.0-right;
	//gl.bindFramebuffer(gl.FRAMEBUFFER,framebuffer);
	//gl.bindTexture(texture, gl.FRAMEBUFFER);

	gl_FragColor = vec4((sin(time)+1.0)/2.0,x/w,y/h,1);
	gl_FragColor = vec4(c,c,c, 1.0);	
}