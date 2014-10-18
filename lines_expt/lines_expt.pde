void setup(){
  size(600,600);
  smooth();
}

void draw(){
  background(255);
  
  int lineXStart = 70;
  int lineEnd = height -20;
  int lineYStart = 20;
  int pointXstart = 20;
  
  
  for (int i = 0; i<6; i++){
    double strokeW = Math.pow(2,i);
    strokeWeight((float)strokeW);
    point((pointXstart + i * 100), (height/(1.5  + 0.25 * i )));
    line((lineXStart + i * 100), lineYStart, (lineXStart + i * 100), lineEnd);
  }
}
