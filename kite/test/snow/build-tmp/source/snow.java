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

public class snow extends PApplet {

int rad = 30;
ArrayList<Snow> arr;
PVector gravity;

//////////////////////////////////////////////////
public void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
  // noStroke();

  arr = new ArrayList<Snow>();
//  gravity = new PVector(0, 0.4, 0);
  gravity = new PVector(0, 0.0f, 0);
}

//////////////////////////////////////////////////
public void update(){
  for (Snow sn : arr) {sn.update();}
}

//////////////////////////////////////////////////
public void draw() { 
  
  // updates ....
  update();

  // drawers ....
  background(255);

  drawGuide();

  pushStyle();
  for (Snow sn : arr) { sn.draw();}
  // filter(BLUR, 5);
  popStyle();
}
//////////////////////////////////////////////////
public void drawGuide(){
  pushStyle();
  stroke(128);
  noFill();
  rect(width/2, height/2, rad, rad);
  popStyle();
}

//////////////////////////////////////////////////
class Snow {
  PVector _speed;
  PVector _pos;
  float _rad;
  float _noise_x;
  int _cnt;

  Snow() {
    _rad = random(5, 20);
    _speed = new PVector(0,1,0);
    _pos = new PVector(random(1.0f)*width, 0, random(1.0f));
    _noise_x = random(-3,3);
    _cnt = 0;
  }
  public void update(){
    _speed.add(gravity);
    _pos.x += _speed.x + _noise_x * (_pos.z)*(_pos.z);
    _pos.y += _speed.y;
    _pos.z += _speed.z;
    _rad = map(_pos.z, -1, 1, 10, 100);
    _cnt++;
    if (_cnt % 100 == 0) _noise_x = random(-3, 3);
  }
  public void draw() {
    // stroke(0); noFill();
    stroke(getColor()); fill(getColor());
    ellipse(_pos.x, _pos.y, _rad, _rad);
  }
  public int getColor(){
    // TODO: Tune!!!!
    int col = (int)map(_pos.z, -1.0f, 1.0f, 242, 88);
    return col;
  }
}

public void keyPressed(){
  arr.add(new Snow());
}

// onClipEvent (load) {
// \u3000\u3000\u3000mc_width = 350; mc_height = 250;
// \u3000\u3000\u3000fy = 1+Math.random()*3;
// \u3000\u3000\u3000n=Math.round(Math.random()*1000);
// \u3000\u3000\u3000this.swapDepths(n);
// \u3000\u3000\u3000this._x=Math.random()*mc_width;
// \u3000\u3000\u3000this._y=-10+Math.random()*mc_height;
// \u3000\u3000\u3000this._xscale=this._yscale=Math.random()*30+20;
// \u3000\u3000\u3000this._alpha=100*n/1000+30;
// \u3000\u3000\u3000dx = Math.random()*200;
// \u3000}

// \u3000onClipEvent(enterFrame) { 
// \u3000\u3000\u3000this._x += Math.cos((this._y+dx)/60);
// \u3000\u3000\u3000this._y += fy;
// \u3000\u3000\u3000if (this._y>=mc_height) {
// \u3000\u3000\u3000\u3000\u3000this._y =-5; }
// \u3000\u3000\u3000if ((this._x>=mc_width) || (this._x<=0)) {
// \u3000\u3000\u3000\u3000\u3000this._x =-10+Math.random()*mc_width;
// \u3000\u3000\u3000\u3000\u3000this._y = -5;
// \u3000\u3000\u3000 }
// \u3000}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "snow" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
