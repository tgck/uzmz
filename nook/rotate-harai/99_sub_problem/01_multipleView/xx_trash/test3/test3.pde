// https://forum.processing.org/one/topic/set-3-viewports-from-3-camera-s-pointing-the-same-object.html

import processing.opengl.*;
import javax.media.opengl.*;
 
int numViews = 100;
GL gl;
float rot;
PVector[] cam = new PVector[numViews];
 
void setup() {
  size(900, 900, OPENGL);
  gl = ((PGraphicsOpenGL)g).beginGL();
  colorMode(RGB, 1);
  stroke(255, 255, 255);
  strokeWeight(2.5);
  setCams();
}
 
void draw() {
  background(0);
  rot += 0.005;
  int s = int(sqrt(numViews));
  int w = width/s;
  int h = height/s;
  for (int i=0; i<numViews; i++) {
    gl.glViewport (i%s*w, i/s*h, w, h); 
    perspective(PI/6, (float) width/height, 1, 1000);
    camera(cam[i].x, cam[i].y, cam[i].z, 0, 0, 0, 0, 1, 0);
    renderGeometry();
  }
  if (frameCount % 60 == 0) { frame.setTitle(int(frameRate) + " fps"); }
}
 
void keyPressed() {
  setCams();
}
 
void setCams() {
  for (int i=0; i<cam.length; i++) {
    PVector r = new PVector();
    while (r.mag() < 0.75) {
      r = new PVector(random(-1, 1), random(-1, 1),  random(-1, 1));
    }
    cam[i] = PVector.mult(r, 600);
  }
}
 
void renderGeometry() {
  pushMatrix();
  scale(60);
  rotateX(rot);
  rotateY(rot);
  beginShape(QUADS);
 
  fill(0, 1, 1); vertex(-1, 1, 1);
  fill(1, 1, 1); vertex( 1, 1, 1);
  fill(1, 0, 1); vertex( 1, -1, 1);
  fill(0, 0, 1); vertex(-1, -1, 1);
 
  fill(1, 1, 1); vertex( 1, 1, 1);
  fill(1, 1, 0); vertex( 1, 1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1, 1);
 
  fill(1, 1, 0); vertex( 1, 1, -1);
  fill(0, 1, 0); vertex(-1, 1, -1);
  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
 
  fill(0, 1, 0); vertex(-1, 1, -1);
  fill(0, 1, 1); vertex(-1, 1, 1);
  fill(0, 0, 1); vertex(-1, -1, 1);
  fill(0, 0, 0); vertex(-1, -1, -1);
 
  fill(0, 1, 0); vertex(-1, 1, -1);
  fill(1, 1, 0); vertex( 1, 1, -1);
  fill(1, 1, 1); vertex( 1, 1, 1);
  fill(0, 1, 1); vertex(-1, 1, 1);
 
  fill(0, 0, 0); vertex(-1, -1, -1);
  fill(1, 0, 0); vertex( 1, -1, -1);
  fill(1, 0, 1); vertex( 1, -1, 1);
  fill(0, 0, 1); vertex(-1, -1, 1);
 
  endShape();
  popMatrix();
}