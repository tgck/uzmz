import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class simple_bubbl extends PApplet {



int actRandomSeed = 0;
int rad = 100;
int colorCount = 7;

int[] hueValues = new int[colorCount];  // \u8272\u76f8
int[] saturationValues = new int[colorCount]; // \u5f69\u5ea6
int[] brightnessValues = new int[colorCount]; // \u660e\u308b\u3055

//////////////////////////////////////////////////
public void setup() {
  size(800, 800, OPENGL);
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
  // noStroke();
}

//////////////////////////////////////////////////
public void draw() { 
	
  background(0,0,0);
  // ------ colors ------
  setupPalette(colorCount);

  // ------ area tiling ------
  pushMatrix();
  translate(width/2, height/2, 0);

  stroke(255, 0, 0, 255);
  // fill(200, 200, 100, 200);
  drawShapeCircle(0, 0, rad, rad, 0);

  popMatrix();
}


// \u518d\u63cf\u753b
public void redraw() {
  actRandomSeed = (int) random(100000);
}

public void drawShapeCircle(float x, float y, float w, float h, int counter) {
	int index = counter % colorCount;
	fill(hueValues[index]*0.5f,saturationValues[index],brightnessValues[index],120);
	ellipse( x, y, w, h);
}

// \u30d1\u30ec\u30c3\u30c8\u3092\u4f5c\u6210\u3059\u308b
public void setupPalette(int colorCount){
  for (int i=0; i<colorCount; i++) {
    if (i%2 == 0) { // \u8272\u76f8\u3068\u660e\u5ea6\u304c\u30e9\u30f3\u30c0\u30e0, \u5f69\u5ea6\u306fMAX
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    } 
    else {
      hueValues[i] = 15;  // \u9752\u3068\u7dd1\u306e\u4e2d\u9593\u8272
      //saturationValues[i] = (int) random(0,20);
      saturationValues[i] = 100;
      brightnessValues[i] = 100;
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "simple_bubbl" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
