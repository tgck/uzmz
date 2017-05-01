int counter = 0;
final float STEP = 0.01;

void setup(){
  size(600, 300, P3D);
  
  colorMode(HSB);
  ellipseMode(CENTER);
  noFill();
  frameRate(30);
}

void draw(){
  
  counter++;
  
  // guide
  background(12);
  translate(width/2, height/2);
  scale(0.96);
  
  // rotate(STEP * counter);
  // rotateZ(STEP * counter);
  // rotateX(20);
  rotateX(STEP * counter);
  rotateY(STEP * counter);

  // chusin
  strokeWeight(2);
  stroke(128, 100,100);
  ellipse(0, 0, 100, 100);

  // eisei
  strokeWeight(1);
  stroke(0, 255, 255);
  rect(100, 0, 10, 10);
}