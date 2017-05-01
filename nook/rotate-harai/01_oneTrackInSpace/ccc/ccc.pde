int counter = 0;
final float STEP = 0.005;
boolean bShowGuide = true;

void setup(){
  size(800, 400, P3D);
  smooth();
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noFill();
  frameRate(30);
}

void draw(){
  
  counter++;
  
  // guide
  background(12);
  translate(width/2, height/2);
  scale(0.96);
      
  rotateX(radians(30));
  rotateY(radians(-30));
  rotateZ(STEP * counter);

  // back
  pushMatrix();
    translate(0, 0, -200);
    fill(0, 0, 30);
    noStroke();
    rect(0, 0, 130, 130);
  popMatrix();

  // Guide
  if (bShowGuide) {
    stroke(240, 100, 100); // Xeon blue - X axis
    strokeWeight(0.5); line(-1000, 0, 0, 0, 0, 0);
    strokeWeight(2.0); line(0, 0, 0, 1000, 0, 0);
    
    stroke(65, 100, 100); // Yellow - Y axis 
    strokeWeight(0.5); line(0, -1000, 0, 0, 0, 0);
    strokeWeight(2.0); line(0, 0, 0, 0, 1000, 0);
    
    stroke(0, 0, 80); // Zinc White - Z axis
    strokeWeight(0.5); line(0, 0, -1000, 0, 0, 0);
    strokeWeight(2.0); line(0, 0, 0, 0, 0, 1000);
  }

  // chusin en
  noFill();
  strokeWeight(2);
  stroke(128, 100, 40); // green
  ellipse(0, 0, 100, 100);
  ellipse(0, 0, 130, 130);

  // eisei
  pushMatrix();
    //rotateZ(radians(0.1*counter));
    rotateZ(radians(1*counter));
    strokeWeight(1);
    stroke(0, 255, 255); // red
    rect(100, 0, 10, 10);
  popMatrix();
}