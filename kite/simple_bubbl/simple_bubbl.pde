import processing.opengl.*;

int actRandomSeed = 0;
int rad = 100;
int colorCount = 7;

int[] hueValues = new int[colorCount];  // 色相
int[] saturationValues = new int[colorCount]; // 彩度
int[] brightnessValues = new int[colorCount]; // 明るさ

//////////////////////////////////////////////////
void setup() {
  size(800, 800, OPENGL);
  colorMode(HSB, 360, 100, 100);
  ellipseMode(CENTER);
  // noStroke();
}

//////////////////////////////////////////////////
void draw() { 
	
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


// 再描画
void redraw() {
  actRandomSeed = (int) random(100000);
}

