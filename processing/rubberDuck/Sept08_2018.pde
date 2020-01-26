PImage duckImage;

void setup(){
  size(500,500);
  background(255, 255, 255);
  colorMode(RGB, 1.0);
  smooth(100);
  duckImage = loadImage("/processing/rubberDuck/duck.png");
  duck = new Duck(width/2,height-646/8);
}

Duck duck;

class Duck{
 float px;
 float py;
 float vel=0;
 float m=100000;
 float k =7;
 
 Duck(float x, float y){
   px=x;
   py=y;
 }
 
 void update(float dt, float pwater){
   //f=ma
   float dx = pwater - (py+646/16-3);
   if(dx>0){dx=0;}
   float a = k*dx /m + 30/m - vel*abs(vel)*0.01;
   vel= (vel +a*dt);
   py = py+vel*dt;
   
   image(duckImage, px, py, 1024/16, 646/16);
 }
 
 
}

class Bubble{
  float px;
  float py;
  float px0;
  float vel=-.03;
  float t=0;
  float r;
  
  Bubble(float x, float y, float r){
    px=x;
    py=y;
    px0=px;
    this.r=r;
  }
  
   void update(float dt){
     stroke(1);
     fill(0,.5,1);
     ellipse(px,py,r,r);
     
     fill(1,1,1);
     ellipse(px-r/7.0,py-r/7.0,r/3.0, r/3.0);
     
     t=t+dt;
     px=px0+5*sin(t/200);
     py=py+vel*dt;
   }
}

class Raindrop{
    float px;
    float py;
    float r = 10;
    float rt2 = sqrt(2);
    float s =0;
    float smax = 60;
    float vel =0;
    
    Raindrop(float x, float y){
      px=x;
      py=y;
    }
    
    void update(float dt){
      stroke(1);
      fill(0,.5,1);
      beginShape();
      vertex(px, py-r-s);
      bezierVertex(px+rt2*r-s/10, py-r, px+rt2*r, py+r, px, py+r);
      bezierVertex(px-rt2*r, py+r, px-rt2*r+s/10, py-r, px, py-r-s);
      endShape();
      
      fill(.9,.9,1);
      stroke(1,1,1,0);
      ellipse(px-4,py-2,4,10+s/10);
      
      s=s+0.1*dt;
      if(s>smax){
         s=smax; 
      }
      vel = vel + .001*dt;
      py=py+vel*dt;

    }
}
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
 
ArrayList<Raindrop> drops = new ArrayList<Raindrop>();

float lastMillis=0;

float waterLevel =0;
float desiredWaterLevel =0;

void draw(){
  background(.7);
  float dt = millis()-lastMillis;
  lastMillis = millis();
  for(int i=drops.size()-1; i>=0; i--){
    Raindrop drop = drops.get(i);
    drop.update(dt);
    if(drop.py > height+50-waterLevel){
      drops.remove(i);
      desiredWaterLevel=desiredWaterLevel+3;
    }
  }
  
  waterLevel = waterLevel+ (desiredWaterLevel-waterLevel)*.01*dt;
  
  fill(.7,.7,.7,1);
  stroke(1,1,1,1);
  rect(-1,height-waterLevel,width+1, waterLevel);
  
  duck.update(dt, height-waterLevel);
  
  fill(0,.5,1,.8);
  stroke(1,1,1,1);
  rect(-1,height-waterLevel,width+1, waterLevel);
  toWait -= dt;
  if(toWait<0){
   toWait =0; 
  }
  desiredWaterLevel-=.1;
  if(desiredWaterLevel<0){
   desiredWaterLevel=0; 
  }
  
  //add bubbles
  float rand=random(1);
  if(rand>.97){
    float randx = random(width);
    float randy = random(height-waterLevel,height);
    bubbles.add(new Bubble(randx,height,10+random(-2,2)));
  }
  
  for(int i=bubbles.size()-1; i>=0; i--){
    Bubble bubble = bubbles.get(i);
    if(bubble.py < height-waterLevel+bubble.r){
      bubbles.remove(i);
      continue;
    }
    bubble.update(dt);
  }
  
}

float toWait = 0;

void wait(float t){
    toWait+=t;
}

void mousePressed() {
  if(toWait<=0){
    drops.add(new Raindrop(mouseX, mouseY));
    wait(65.0);
  }
}

void mouseDragged() 
{
  if(toWait<=0){
   drops.add(new Raindrop(mouseX, mouseY));
   wait(65.0);
  }
   
}
