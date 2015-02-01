var kochArray;
function setup() {
  createCanvas(800, 800);
  kochArray = [];
  
  var a = new p5.Vector(20, 200);
  var b = new p5.Vector(width * 0.8, 200);
  var k0 = new KochObj(a, b);
  kochArray.push(k0);
  
  for (var i = 0; i < 5; i++) {
    KochGenerator();
  }
}

function draw() {
  background(255);
  kochArray.forEach(function(kochline){
    kochline.display();
  });
  
}

function drawCircles(x, y, radius ){
  stroke(0);
  noFill();
  ellipse(x, y, radius, radius);
  if(radius >2){
    drawCircles(( x + radius/2),y, radius/2, radius/2  )
    drawCircles(( x - radius/2),y, radius/2, radius/2  )
    
  }
}

function KochGenerator(){
  var nextArr = [];
  
  kochArray.forEach(function(kochline){
    var a = kochline.koch1();
    var b = kochline.koch2();
    var c = kochline.koch3();
    var d = kochline.koch4();
    var e = kochline.koch5();
 
    nextArr.push(new KochObj(a, b));
    nextArr.push(new KochObj(b, c));
    nextArr.push(new KochObj(c, d));
    nextArr.push(new KochObj(d, e));
  });
  
  kochArray = nextArr;
}

function KochObj(a, b){
  this.start = a;
  this.end = b;
  this.display  = function(){
    stroke(0);
    line(this.start.x, this.start.y, this.end.x, this.end.y);
  }
  
  this.koch1 = function(){
    return this.start.get();
  }
  
  this.koch2 = function(){
    var newV = p5.Vector.sub(this.end, this.start);
    return newV.div(3).add(this.start);
  }
  
  this.koch3 = function(){
    var a = this.start.get();
    var newV = p5.Vector.sub(this.end, this.start);
    newV.div(3);
    a.add(newV);
    
    newV.rotate(-radians(60));
    a.add(newV);
    
    return a;
  }
  
  this.koch4 = function(){
    var newV = p5.Vector.sub(this.end, this.start);
    return newV.mult(2/3).add(this.start);
  },
  
  this.koch5= function(){
    return this.end.get();
  }
  
}



