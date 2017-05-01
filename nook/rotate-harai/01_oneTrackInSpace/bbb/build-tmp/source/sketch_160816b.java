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

public class sketch_160816b extends PApplet {

int counter = 0;
final float STEP = 0.01f;

public void setup(){
  
  
  colorMode(HSB);
  ellipseMode(CENTER);
  noFill();
  frameRate(30);
}

public void draw(){
  
  counter++;
  
  // guide
  background(12);
  translate(width/2, height/2);
  scale(0.96f);
  
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
  public void settings() {  size(600, 300, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_160816b" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
