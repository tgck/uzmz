import peasy.*;

// config
boolean bHSB = true;
int counter = 0;
final float STEP = 1;

// essentials
PGraphics q1, q2, q3, q4;
PeasyCam cam;

float xmag, ymag = 0;
float newXmag, newYmag = 0; 

void setup()
{
  size(480, 960, P3D);
  //   size(480, 640, P3D);
  smooth();
  // ( 480 x 240 )* 4
  // |-------|
  // |   Q1  |
  // |-------|
  // |   Q2  |
  // |-------|
  // |   Q3  |
  // |-------|
  // |   Q4  |
  // |-------|
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

  q1 = createGraphics(width, height/4, P3D);
  q2 = createGraphics(width, height/4, P3D);
  q3 = createGraphics(width, height/4, P3D);
  q4 = createGraphics(width, height/4, P3D);
}

void draw(){
  
    drawQuadrant(q1,new float[]{100,0,0,0,0,0,0,0,1});
    drawQuadrant(q2,new float[]{0,100,0,0,0,0,0,0,1});
    drawQuadrant(q3,new float[]{0,0,100,0,0,0,0,1,0});
    drawQuadrant(q4,new float[]{57,57,57,0,0,0,0,0,1});

    image(q1, 0, 0);
    image(q2, 0, height * 1/4);
    image(q3, 0, height * 2/4);
    image(q4, 0, height * 3/4);
}

void drawQuadrant(PGraphics pg, float[] camParams) {
  pg.beginDraw();
  
  if (bHSB) {
    pg.colorMode(HSB, 360, 100, 100); // OK
    // pg.background(0,100,80); // red
    pg.background(0,0,0); // black
  } else {
    pg.colorMode(RGB, 1);
    pg.background(0,0,0);
  }
  
  // pg.noStroke();
  pg.strokeWeight(0.05);
  pg.stroke(0);
  pg.camera(camParams[0],camParams[1],camParams[2],
            camParams[3],camParams[4],camParams[5],
            camParams[6],camParams[7],camParams[8]);
  // draw common scene
  drawRGBCube(pg);
  
  pg.endDraw(); 
}