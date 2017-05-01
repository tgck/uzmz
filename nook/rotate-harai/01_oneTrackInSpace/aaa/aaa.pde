int counter = 0;
final float STEP = 0.01;

void setup(){
  size(600, 300, P2D);
  strokeWeight(3);
  colorMode(HSB);
  ellipseMode(CENTER);
  noFill();

  stroke(128, 128, 128);
  ellipse(0, 0, 100, 100);
  frameRate(30);
}

void draw(){
  
  counter++;
  
  // guide
  background(12);
  translate(width/2, height/2);
  scale(0.96);
  
  rotate(STEP * counter);
  stroke(128, 100,100);
  rect(100, 0, 10, 10);
  
  
  ellipse(0, 0, 100, 100);
  
}