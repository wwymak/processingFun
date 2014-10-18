int height = 600;
int width = 600;

int textStartX;
int textStartY;
int textX;
int textY;

PVector location;
PVector velocity;

PFont wingdings;

float xspeed = 1;
float yspeed = 3.3;

class PVector{
  float x;
  float y;
  
  PVector(float x_, float y_){
    x = x_;
    y=y_;
  }
  
  void add(PVector v) {
    y = y + v.y;
    x = x + v.x;
  }

}

void setup(){
  size(width, height);
  smooth();
  strokeWeight(2);
  background(255);
  wingdings = loadFont("Wingdings-Regular-48.vlw");
  
  location = new PVector(width/2,height/2);
  velocity = new PVector(2.5,5);
}

void draw(){
  
  
  location.add(velocity);
  if((location.x > width) || (location.x < 0)){
    velocity.x = -1 * velocity.x;
  }
  if ((location.y > height) || (location.y < 0)){
    velocity.y =  -1 * velocity.y;
  }
  
  print(Float.toString(location.x), Float.toString(location.y));
}

void keyPressed(){
  // location = new PVector(width/2,height/2);
  // velocity = new PVector(2.5,5);
  
  
  // location.add(velocity);
  
  fill(random(255));
  textFont(wingdings, 24);
  text(key, location.x, location.y);
}
