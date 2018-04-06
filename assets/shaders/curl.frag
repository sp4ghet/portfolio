#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 resolution;
uniform vec2 mouse;
uniform sampler2D backbuffer;
uniform float time;
varying vec3 vcolor;

//----------------------------------------------------------------------------------------------------------------------

vec3 cosine_gradient(float x, vec3 r, vec3 g, vec3 b, vec3 a);
float noise(vec3 p);

vec3 cosine_gradient(float x, vec3 offset, vec3 amp, vec3 freq, vec3 phase){
  phase *= 3.14159265 * 2.;
  x *= 3.14159265 * 2.;

  return vec3(
    (offset.r) + amp.r * cos(x * freq.r + phase.r),
    (offset.g) + amp.g * cos(x * freq.g + phase.g),
    (offset.b) + amp.b * cos(x * freq.b + phase.b)
    );
}

//	Simplex 3D Noise
//	by Ian McEwan, Ashima Arts
//----------------------------------------------------------------------------------------------------------------------
vec4 permute(vec4 x){return mod(((x*34.0)+1.0)*x, 289.0);}
vec4 taylorInvSqrt(vec4 r){return 1.79284291400159 - 0.85373472095314 * r;}

float noise(vec3 v){
  const vec2  C = vec2(1.0/6.0, 1.0/3.0) ;
  const vec4  D = vec4(0.0, 0.5, 1.0, 2.0);

// First corner
  vec3 i  = floor(v + dot(v, C.yyy) );
  vec3 x0 =   v - i + dot(i, C.xxx) ;

// Other corners
  vec3 g = step(x0.yzx, x0.xyz);
  vec3 l = 1.0 - g;
  vec3 i1 = min( g.xyz, l.zxy );
  vec3 i2 = max( g.xyz, l.zxy );

  //  x0 = x0 - 0. + 0.0 * C
  vec3 x1 = x0 - i1 + 1.0 * C.xxx;
  vec3 x2 = x0 - i2 + 2.0 * C.xxx;
  vec3 x3 = x0 - 1. + 3.0 * C.xxx;

// Permutations
  i = mod(i, 289.0 );
  vec4 p = permute( permute( permute(
             i.z + vec4(0.0, i1.z, i2.z, 1.0 ))
           + i.y + vec4(0.0, i1.y, i2.y, 1.0 ))
           + i.x + vec4(0.0, i1.x, i2.x, 1.0 ));

// Gradients
// ( N*N points uniformly over a square, mapped onto an octahedron.)
  float n_ = 1.0/7.0; // N=7
  vec3  ns = n_ * D.wyz - D.xzx;

  vec4 j = p - 49.0 * floor(p * ns.z *ns.z);  //  mod(p,N*N)

  vec4 x_ = floor(j * ns.z);
  vec4 y_ = floor(j - 7.0 * x_ );    // mod(j,N)

  vec4 x = x_ *ns.x + ns.yyyy;
  vec4 y = y_ *ns.x + ns.yyyy;
  vec4 h = 1.0 - abs(x) - abs(y);

  vec4 b0 = vec4( x.xy, y.xy );
  vec4 b1 = vec4( x.zw, y.zw );

  vec4 s0 = floor(b0)*2.0 + 1.0;
  vec4 s1 = floor(b1)*2.0 + 1.0;
  vec4 sh = -step(h, vec4(0.0));

  vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy ;
  vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww ;

  vec3 p0 = vec3(a0.xy,h.x);
  vec3 p1 = vec3(a0.zw,h.y);
  vec3 p2 = vec3(a1.xy,h.z);
  vec3 p3 = vec3(a1.zw,h.w);

//Normalise gradients
  vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2, p2), dot(p3,p3)));
  p0 *= norm.x;
  p1 *= norm.y;
  p2 *= norm.z;
  p3 *= norm.w;

// Mix final noise value
  vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
  m = m * m;
  return 42.0 * dot( m*m, vec4( dot(p0,x0), dot(p1,x1),
                                dot(p2,x2), dot(p3,x3) ) );
}

//----------------------------------------------------------------------------------------------------------------------

vec3 my_gradient(float x){
  return cosine_gradient(
    x,
    vec3(.748, .718, .5) ,
    vec3(.5, .798, .368),
    vec3(.828, 1.038, -0.452),
    vec3(1.468, -0.132, -0.882));
}

float my_noise(vec2 p, float multiplier){

  vec2 new_mouse = (mouse*2.)-1.;
  float larger_ratio = max(resolution.x, resolution.y) / min(resolution.x, resolution.y);
  new_mouse.x *= larger_ratio;
  new_mouse *= multiplier;

  return 0.5*noise(vec3(p, time/5.)) - 2. / exp(length(p-new_mouse));
}

vec2 nabla(vec2 p, float multiplier){
  vec2 deltaX = vec2(0.001, 0.);
  vec2 deltaY = vec2(0., 0.001);

  p *= multiplier;
  float x = my_noise(p+deltaX, multiplier) - my_noise(p-deltaX, multiplier);
  float y = my_noise(p+deltaY, multiplier) - my_noise(p-deltaY, multiplier);

  vec2 curled = -vec2(x, y);

  //enable this to debug since the gradients are so small it's hard to visualize
  // curled = normalize(curled);

  return curled;
}

void main(){
  vec2 p = (gl_FragCoord.xy * 2. - resolution) / min(resolution.x, resolution.y);
  vec2 uv = gl_FragCoord.xy / resolution;
  vec4 color = vec4(0.);

  float scale;
  vec2 displacement = nabla(p, 1.);
  scale = noise(vec3(p,0.));
  color = vec4(my_gradient(scale), 1.);

  if (time > .25){
    color = .99 * texture2D(backbuffer, fract(uv+displacement));
    color += .01*vec4(my_gradient(scale), 1.);
  }

  gl_FragColor = color;
}
