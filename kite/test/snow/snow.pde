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
  gravity = new PVector(0, 1, 0);
}

//////////////////////////////////////////////////
void update(){
  print("hoge");
  for (Snow sn : arr) {sn.update();}

}

//////////////////////////////////////////////////
void draw() { 
  
  update();

	print(" piyo");
  background(255);

  stroke(128);
  noFill();
  rect(width/2, height/2, rad, rad);

  for (Snow sn : arr) {
    sn.draw();
  }
}

//////////////////////////////////////////////////
class Snow {
  PVector _speed;
  PVector _pos;
  float _rad;

  Snow() {
    _rad = random(5, 20);
    _speed = new PVector(0,10,0);
    _pos = new PVector(random(1.0)*width, 0, random(1.0));
  }
  void update(){
    _speed.add(gravity);
    _pos.x += _speed.x;
    _pos.y += _speed.y;
    _pos.z += _speed.z;
    println(":"+ nf(_pos.x, 1,2) + nf(_pos.y,1,2));
  }
  void draw() {
    stroke(0); noFill();
    ellipse(_pos.x, _pos.y, _rad, _rad);
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