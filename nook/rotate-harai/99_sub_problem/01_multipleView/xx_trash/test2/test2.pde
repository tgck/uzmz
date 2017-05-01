// https://forum.processing.org/one/topic/set-3-viewports-from-3-camera-s-pointing-the-same-object.html

PGraphics topleft, topright, bottomleft, bottomright;
color c;
 
void setup() {
  size(800, 800, P3D);
  topleft = createGraphics(400, 400, P3D);
  topright = createGraphics(400, 400, P3D);
  bottomleft = createGraphics(400, 400, P3D);
  bottomright = createGraphics(400, 400, P3D);
}
 
void draw() {
  updateVariables();
  drawCube(topleft, cos(frameCount*0.01)*200, sin(3.5 + frameCount*0.01)*200);
  drawCube(topright, sin(frameCount*0.01)*200, cos(10+frameCount*0.01)*200);
  drawCube(bottomleft, sin(frameCount*0.01)*200, cos(13.5 + frameCount*0.01)*200);
  drawCube(bottomright, sin(9.8+frameCount*0.01)*200, cos(5.6+frameCount*0.01)*200);
  image(topleft, 0, 0);
  image(topright, 400, 0);
  image(bottomleft, 0, 400);
  image(bottomright, 400, 400);
  line(400, 0, 400, height);
  line(0, 400, width, 400);
}
 
void updateVariables() {
  if (frameCount % 60 == 0) {
    c = color(random(255), random(255), random(255));
  }
}
 
void drawCube(PGraphics pg, float eyeX, float eyeY) {
  pg.beginDraw();
  pg.background(255);
  pg.smooth();
  pg.lights();
  pg.camera(
    eyeX, eyeY, (pg.height/2.0) / tan(PI*60.0 / 360.0),
    pg.width/2.0, pg.height/2.0, 0,
    0, 1, 0
  );
  pg.translate(pg.width/2, pg.height/2);
  pg.fill(c);
  pg.noStroke();
  pg.box(200);
  pg.endDraw();
}