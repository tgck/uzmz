// https://forum.processing.org/one/topic/color-from-int-to-col.html

int i=0;

int B_MASK = 255;
int G_MASK = 255<<8;
int R_MASK = 255<<16;

void setup() {
  size(200, 200,P2D);
}

void draw () { 
  fill (getColorFromInt(i));
  // fill(i);
  rect ( 10,10,101,101);
  delay (2);
  i++;
}

color getColorFromInt(int i) {

  // then : 
  int r = i & R_MASK;
  int g = i & G_MASK;
  int b = i & B_MASK;
  println(r + " ," + g/256 + ", " + b);
  return (color(r,g,b));
}