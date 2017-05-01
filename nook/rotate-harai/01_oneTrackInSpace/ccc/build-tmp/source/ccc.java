import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ccc extends PApplet {

int counter = 0;
final float STEP = 0.005f;
boolean bShowGuide = true;

public void setup(){
  
  
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noFill();
  frameRate(30);
}

public void draw(){
  
  counter++;
  
  // guide
  background(12);
  translate(width/2, height/2);
  scale(0.96f);
      
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
    strokeWeight(0.5f); line(-1000, 0, 0, 0, 0, 0);
    strokeWeight(2.0f); line(0, 0, 0, 1000, 0, 0);
    
    stroke(65, 100, 100); // Yellow - Y axis 
    strokeWeight(0.5f); line(0, -1000, 0, 0, 0, 0);
    strokeWeight(2.0f); line(0, 0, 0, 0, 1000, 0);
    
    stroke(0, 0, 80); // Zinc White - Z axis
    strokeWeight(0.5f); line(0, 0, -1000, 0, 0, 0);
    strokeWeight(2.0f); line(0, 0, 0, 0, 0, 1000);
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
  public void settings() {  size(800, 400, P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ccc" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
