import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 
import java.awt.event.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class HelloPeasy extends PApplet {




PeasyCam cam;

public void setup() {
  
  
  
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(500);
}
public void draw() {
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

  public void settings() {  size(600,200,P3D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "HelloPeasy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
