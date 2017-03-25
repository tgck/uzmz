int rad = 30;
ArrayList<Snow> arr;
PVector gravity;

//////////////////////////////////////////////////
void setup() {
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
  // noStroke();

  arr = new ArrayList<Snow>();
//  gravity = new PVector(0, 0.4, 0);
  gravity = new PVector(0, 0.0, 0);
}

//////////////////////////////////////////////////
void update(){
  for (Snow sn : arr) {sn.update();}
}

//////////////////////////////////////////////////
void draw() { 
  
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
void drawGuide(){
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
    _pos = new PVector(random(1.0)*width, 0, random(1.0));
    _noise_x = random(-3,3);
    _cnt = 0;
  }
  void update(){
    _speed.add(gravity);
    _pos.x += _speed.x + _noise_x * (_pos.z)*(_pos.z);
    _pos.y += _speed.y;
    _pos.z += _speed.z;
    _rad = map(_pos.z, -1, 1, 10, 100);
    _cnt++;
    if (_cnt % 100 == 0) _noise_x = random(-3, 3); // TODO, Deleteする
  }
  void draw() {
    // stroke(0); noFill();
    stroke(getColor()); fill(getColor());
    ellipse(_pos.x, _pos.y, _rad, _rad);
  }
  int getColor(){
    // TODO: Tune!!!!
    int col = (int)map(_pos.z, -1.0, 1.0, 242, 88);
    return col;
  }
}

void keyPressed(){
  arr.add(new Snow());
}

// onClipEvent (load) {
// 　　　mc_width = 350; mc_height = 250;
// 　　　fy = 1+Math.random()*3;
// 　　　n=Math.round(Math.random()*1000);
// 　　　this.swapDepths(n);
// 　　　this._x=Math.random()*mc_width;
// 　　　this._y=-10+Math.random()*mc_height;
// 　　　this._xscale=this._yscale=Math.random()*30+20;
// 　　　this._alpha=100*n/1000+30;
// 　　　dx = Math.random()*200;
// 　}

// 　onClipEvent(enterFrame) { 
// 　　　this._x += Math.cos((this._y+dx)/60);
// 　　　this._y += fy;
// 　　　if (this._y>=mc_height) {
// 　　　　　this._y =-5; }
// 　　　if ((this._x>=mc_width) || (this._x<=0)) {
// 　　　　　this._x =-10+Math.random()*mc_width;
// 　　　　　this._y = -5;
// 　　　 }
// 　}