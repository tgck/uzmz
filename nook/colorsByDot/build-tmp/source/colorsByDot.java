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

public class colorsByDot extends PApplet {

int B_MASK = 255;
int G_MASK = 255<<8;
int R_MASK = 255<<16;
int bar_height = 10;
int span = 8;

public void setup(){
   
  colorMode(RGB);
  noStroke();
  rectMode(CORNER);
  background(0);
  
  dumpColor2(0, 0* (bar_height + span), 7);
  dumpColor2(0, 1* (bar_height + span), 6);
  dumpColor2(0, 2* (bar_height + span), 5);
  dumpColor2(0, 3* (bar_height + span), 4);
  dumpColor2(0, 4* (bar_height + span), 3);
  dumpColor2(0, 5* (bar_height + span), 2);
  dumpColor2(0, 6* (bar_height + span), 1);
  dumpColor2(0, 7* (bar_height + span), 0);
}

public void dumpColor2(int start_x, int start_y, int mode){
  int col;
  int bR, bG, bB;
  switch (mode) {
    case 7: bR = 1; bG = 1; bB = 1 ; break; // \u767d
    case 6: bR = 1; bG = 1; bB = 0 ; break; // \u30a4\u30a8\u30ed\u30fc
    case 5: bR = 1; bG = 0; bB = 1 ; break; // \u30de\u30bc\u30f3\u30c0
    case 4: bR = 1; bG = 0; bB = 0 ; break; // \u8d64
    case 3: bR = 0; bG = 1; bB = 1 ; break; // \u30b7\u30a2\u30f3
    case 2: bR = 0; bG = 1; bB = 0 ; break; // \u7dd1
    case 1: bR = 0; bG = 0; bB = 1 ; break; // \u9752
    case 0: bR = 0; bG = 0; bB = 0 ; break; // \u9ed2
    default: bR = 1; bG = 1; bB = 1 ; break; // debug
  }
  // col = color(255, 255, 0, 255);
  pushMatrix();
  translate(start_x, start_y);
  println("\n\nMode: " + mode);
  for (int i =0; i<256; i++) {
    // \u30d3\u30c3\u30c8\u6f14\u7b97\u7684\u306a\u3082\u306e
    // http://www.technotype.net/processing/reference/leftshift.html
    // https://processing.org/discourse/beta/num_1145670451.html
    col = color( i * bR, i * bG, i * bB );

    int rr = i<<16 & R_MASK;
    int gg = i<<8 & G_MASK;
    int bb = i & B_MASK;
    String r = String.valueOf( rr * bR /(256*256));
    String g = String.valueOf( gg * bG /256);
    String b = String.valueOf( bb * bB);
    print("[" + i + "]" + r + "," + g + "," + b 
           + "::" + "(" + rr + "," + gg + "," + bb +")  " );
    
    fill(col);
    rect(i, 0, 1, bar_height);
  }
  popMatrix();
}
  public void settings() {  size(256, 136); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "colorsByDot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
