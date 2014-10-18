void setup(){
  size(600,600);
  smooth();
  background(255);
  
}

void draw(){}

void mousePressed(){
  if (mouseButton == RIGHT){
    strokeWeight(5);
    point(mouseX, mouseY);
  }
  else{
    strokeWeight(1);
    float d = random(2, 20);
    ellipse(mouseX, mouseY, d, d);
    noFill();
  }
}

void mouseDragged(){
  
}
