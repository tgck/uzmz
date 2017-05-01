import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class eee extends PApplet {



// config
boolean bHSB = true;
int counter = 0;
final float STEP = 1;

// essentials
PGraphics q1, q2, q3, q4;
PeasyCam cam;

float xmag, ymag = 0;
float newXmag, newYmag = 0; 

public void setup()
{
  
  //   size(480, 640, P3D);
  
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

  q1 = createGraphics(width, height/4, P3D);
  q2 = createGraphics(width, height/4, P3D);
  q3 = createGraphics(width, height/4, P3D);
  q4 = createGraphics(width, height/4, P3D);

  // cam = new PeasyCam(this, 100);
  cam = new PeasyCam(this, q2, .0f, .0f, .0f, .100f);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);

}

public void draw(){
  
    drawQuadrant(q1,new float[]{100,0,0,0,0,0,0,0,1});
    drawQuadrant(q2,new float[]{0,100,0,0,0,0,0,0,1});
    drawQuadrant(q3,new float[]{0,0,100,0,0,0,0,1,0});
    drawQuadrant(q4,new float[]{57,57,57,0,0,0,0,0,1});

    image(q1, 0, 0);
    image(q2, 0, height * 1/4);
    image(q3, 0, height * 2/4);
    image(q4, 0, height * 3/4);

    // easyCam \u306f\u751f\u304d\u3066\u3044\u308b\u306e\u3060\u3051\u3069
    // \u6700\u7d42\u7684\u306b\u63cf\u753b\u3055\u308c\u308b\u306a\u3044\u3088\u3046\u306b\u305d\u308c\u304c\u52b9\u3044\u3066\u3044\u306a\u3044\u307d\u3044
    println("cam is active?:" + String.valueOf(cam.isActive()) + " / " + 
      String.valueOf(cam.getDistance()));
}

public void drawQuadrant(PGraphics pg, float[] camParams) {
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
  pg.strokeWeight(0.05f);
  pg.stroke(0);
  pg.camera(camParams[0],camParams[1],camParams[2],
            camParams[3],camParams[4],camParams[5],
            camParams[6],camParams[7],camParams[8]);
  // draw common scene
  drawRGBCube(pg);

  pg.endDraw(); 
}

public void printInfo(int x, int y) {
  String str = "info.";
  str += String.valueOf(cam.getDistance()) + "\n";
  str += String.valueOf(cam.isActive());

  pushMatrix();
    fill(255, 255, 255);
    translate(35,0,0);
    text(str, x, y);
  popMatrix();

}
// http://waltergordy.blogspot.jp/2014/04/multiple-viewports-in-processing.html

public void drawRGBCube(PGraphics pg)
{
  pg.pushMatrix();
  
  newXmag = mouseX/PApplet.parseFloat(width) * TWO_PI;
  newYmag = mouseY/PApplet.parseFloat(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01f) { 
    xmag -= diff/4.0f; 
  }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01f) { 
    ymag -= diff/4.0f; 
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

public void drawInHSBRotate (PGraphics pg){
  
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

public void drawInHSB (PGraphics pg){

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

public void drawInRGB(PGraphics pg) {
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
  public void settings() {  size(480, 960, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "eee" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
