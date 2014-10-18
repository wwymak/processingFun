int height = 600;
int width = 600;
ArrayList<textObject> textObjList;
PFont wingdings;

void setup(){
  size(width, height);
  smooth();
  background(255);
  wingdings = loadFont("Wingdings-Regular-48.vlw");
  
  textObjList = new ArrayList<textObject>();
  
}

void draw(){
  for (textObject obj : textObjList){
    obj.update();
    obj.render();
    // obj.translateMyObj();
  }
}

void keyPressed(){
  textObjList.add(new textObject(key));
}

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

class textObject {
  PVector location;
  PVector velocity;
  char pressed;
  
  textObject(char mKey){ 
  
    location = new PVector(width/2, height/2);
    velocity = new PVector(random(1,5), random(1,5));
    pressed = mKey;
    render();
  }
  
  
  
  void update(){
    location.add(velocity);
    if((location.x > width) || (location.x < 0)){
      velocity.x = -1 * velocity.x;
    }
    if ((location.y > height) || (location.y < 0)){
      velocity.y =  -1 * velocity.y;
    }
  }
  void render(){
    fill(random(255));
    textFont(wingdings, 24);
    pushMatrix();
    translate(location.x, location.y);
    text(pressed, 0 ,0);
    text(pressed, location.x, location.y);
    popMatrix();
  }
  
  void translateMyObj(){
    translate(location.x, location.y);
  }
  
  
  
}
