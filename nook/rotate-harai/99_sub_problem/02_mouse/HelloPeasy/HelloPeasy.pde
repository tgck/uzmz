import peasy.*;

PeasyCam cam;

void setup() {
  size(600,200,P3D);
  smooth();
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}
void draw() {
//  rotateX(-.5);
//  rotateY(-.5);
  background(0);
  fill(255,0,0);
  box(30);
  pushMatrix();
    translate(0,0,20);
    fill(0,0,255);
    box(5);
  popMatrix();

  printInfo(0,0);
}

void printInfo(int x, int y) {
  String str = "info.";
  str += String.valueOf(cam.getDistance()) + "\n";
  str += String.valueOf(cam.isActive());

  pushMatrix();
    fill(255, 255, 255);
    translate(35,0,0);
    text(str, x, y);
  popMatrix();

}

