PGraphics q1, q2, q3, q4;
float xmag, ymag = 0;
float newXmag, newYmag = 0; 

boolean bHSB = true;

void setup()
{
  size(640, 480, P3D);
  smooth();
  // |-------|-------|
  // |   Q1  |  Q2   |
  // |-------|-------|
  // |   Q3  |  Q4   |
  // |_______|_______|

  q1 = createGraphics(width/2, height/2, P3D);
  q2 = createGraphics(width/2, height/2, P3D);
  q3 = createGraphics(width/2, height/2, P3D);
  q4 = createGraphics(width/2, height/2, P3D);
}

void draw(){
  
    drawQuadrant(q1,new float[]{100,0,0,0,0,0,0,0,1});
  
    image(q1, 0, 0);
    image(q1, width/2, 0);
    image(q1, 0, height/2);
    image(q1, width/2, height/2);
}

void drawQuadrant(PGraphics pg, float[] camParams) {
  pg.beginDraw();
  
  if (bHSB) {
    pg.colorMode(HSB, 360, 100, 100); // OK
    pg.background(0,100,80); // red
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