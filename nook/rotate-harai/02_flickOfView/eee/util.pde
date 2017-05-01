// http://waltergordy.blogspot.jp/2014/04/multiple-viewports-in-processing.html

void drawRGBCube(PGraphics pg)
{
  pg.pushMatrix();
  
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { 
    xmag -= diff/4.0; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { 
    ymag -= diff/4.0; 
  }
  
  pg.rotateX(-ymag); 
  pg.rotateY(-xmag); 
  
  pg.scale(30);
  pg.beginShape(QUADS);

  if (bHSB) {
    // drawInHSB(pg);
    drawInHSBRotate(pg);
  } else {
    drawInRGB(pg); 
  }
  
  pg.endShape();
  
  pg.popMatrix(); 
}

void drawInHSBRotate (PGraphics pg){
  
  float shift = ( counter * STEP )% 360;
  counter++;
  
  pg.fill(180 + shift, 100, 100); pg.vertex(-1,  1,  1);
  pg.fill(shift, 0, 100); pg.vertex( 1,  1,  1);
  pg.fill(300 + shift, 100, 100); pg.vertex( 1, -1,  1);
  pg.fill(240 + shift, 100, 100); pg.vertex(-1, -1,  1);

  pg.fill(shift, 0, 100); pg.vertex( 1,  1,  1);
  pg.fill(60 + shift, 100, 100); pg.vertex( 1,  1, -1);
  pg.fill(shift, 100, 100); pg.vertex( 1, -1, -1);
  pg.fill(300 + shift, 100, 100); pg.vertex( 1, -1,  1);

  pg.fill(60 + shift, 100, 100); pg.vertex( 1,  1, -1);
  pg.fill(120 + shift, 100, 100); pg.vertex(-1,  1, -1);
  pg.fill(shift, 0, 0); pg.vertex(-1, -1, -1);
  pg.fill(shift, 100, 100); pg.vertex( 1, -1, -1);

  pg.fill(120 + shift, 100, 100); pg.vertex(-1,  1, -1);
  pg.fill(180 + shift, 100, 100); pg.vertex(-1,  1,  1);
  pg.fill(240 + shift, 100, 100); pg.vertex(-1, -1,  1);
  pg.fill(shift, 0, 0); pg.vertex(-1, -1, -1);

  pg.fill(120 + shift, 100, 100); pg.vertex(-1,  1, -1);
  pg.fill(60 + shift, 100, 100); pg.vertex( 1,  1, -1);
  pg.fill(shift, 0, 100); pg.vertex( 1,  1,  1);
  pg.fill(180 + shift, 100, 100); pg.vertex(-1,  1,  1); 

  pg.fill(shift, 0, 0); pg.vertex(-1, -1, -1);
  pg.fill(shift, 100, 100); pg.vertex( 1, -1, -1);
  pg.fill(300 + shift, 100, 100); pg.vertex( 1, -1,  1);
  pg.fill(240 + shift, 100, 100); pg.vertex(-1, -1,  1);

}

void drawInHSB (PGraphics pg){

  pg.fill(180, 100, 100); pg.vertex(-1,  1,  1);
  pg.fill(0, 0, 100); pg.vertex( 1,  1,  1);
  pg.fill(300, 100, 100); pg.vertex( 1, -1,  1);
  pg.fill(240, 100, 100); pg.vertex(-1, -1,  1);

  pg.fill(0, 0, 100); pg.vertex( 1,  1,  1);
  pg.fill(60, 100, 100); pg.vertex( 1,  1, -1);
  pg.fill(0, 100, 100); pg.vertex( 1, -1, -1);
  pg.fill(300, 100, 100); pg.vertex( 1, -1,  1);

  pg.fill(60, 100, 100); pg.vertex( 1,  1, -1);
  pg.fill(120, 100, 100); pg.vertex(-1,  1, -1);
  pg.fill(0, 0, 0); pg.vertex(-1, -1, -1);
  pg.fill(1, 100, 100); pg.vertex( 1, -1, -1);

  pg.fill(120, 100, 100); pg.vertex(-1,  1, -1);
  pg.fill(180, 100, 100); pg.vertex(-1,  1,  1);
  pg.fill(240, 100, 100); pg.vertex(-1, -1,  1);
  pg.fill(0, 0, 0); pg.vertex(-1, -1, -1);

  pg.fill(120, 100, 100); pg.vertex(-1,  1, -1);
  pg.fill(60, 100, 100); pg.vertex( 1,  1, -1);
  pg.fill(0, 0, 100); pg.vertex( 1,  1,  1);
  pg.fill(180, 100, 100); pg.vertex(-1,  1,  1); 

  pg.fill(0, 0, 0); pg.vertex(-1, -1, -1);
  pg.fill(0, 100, 100); pg.vertex( 1, -1, -1);
  pg.fill(300, 100, 100); pg.vertex( 1, -1,  1);
  pg.fill(240, 100, 100); pg.vertex(-1, -1,  1);

}

void drawInRGB(PGraphics pg) {
  pg.fill(0, 1, 1); pg.vertex(-1,  1,  1);
  pg.fill(1, 1, 1); pg.vertex( 1,  1,  1);
  pg.fill(1, 0, 1); pg.vertex( 1, -1,  1);
  pg.fill(0, 0, 1); pg.vertex(-1, -1,  1);

  pg.fill(1, 1, 1); pg.vertex( 1,  1,  1);
  pg.fill(1, 1, 0); pg.vertex( 1,  1, -1);
  pg.fill(1, 0, 0); pg.vertex( 1, -1, -1);
  pg.fill(1, 0, 1); pg.vertex( 1, -1,  1);

  pg.fill(1, 1, 0); pg.vertex( 1,  1, -1);
  pg.fill(0, 1, 0); pg.vertex(-1,  1, -1);
  pg.fill(0, 0, 0); pg.vertex(-1, -1, -1);
  pg.fill(1, 0, 0); pg.vertex( 1, -1, -1);

  pg.fill(0, 1, 0); pg.vertex(-1,  1, -1);
  pg.fill(0, 1, 1); pg.vertex(-1,  1,  1);
  pg.fill(0, 0, 1); pg.vertex(-1, -1,  1);
  pg.fill(0, 0, 0); pg.vertex(-1, -1, -1);
 
  pg.fill(0, 1, 0); pg.vertex(-1,  1, -1);
  pg.fill(1, 1, 0); pg.vertex( 1,  1, -1);
  pg.fill(1, 1, 1); pg.vertex( 1,  1,  1);
  pg.fill(0, 1, 1); pg.vertex(-1,  1,  1); 

  pg.fill(0, 0, 0); pg.vertex(-1, -1, -1);
  pg.fill(1, 0, 0); pg.vertex( 1, -1, -1);
  pg.fill(1, 0, 1); pg.vertex( 1, -1,  1);
  pg.fill(0, 0, 1); pg.vertex(-1, -1,  1);
}