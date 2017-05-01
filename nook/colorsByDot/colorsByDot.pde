int B_MASK = 255;
int G_MASK = 255<<8;
int R_MASK = 255<<16;
int bar_height = 10;
int span = 8;

void setup(){
  size(256, 136); 
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

void dumpColor2(int start_x, int start_y, int mode){
  int col;
  int bR, bG, bB;
  switch (mode) {
    case 7: bR = 1; bG = 1; bB = 1 ; break; // 白
    case 6: bR = 1; bG = 1; bB = 0 ; break; // イエロー
    case 5: bR = 1; bG = 0; bB = 1 ; break; // マゼンダ
    case 4: bR = 1; bG = 0; bB = 0 ; break; // 赤
    case 3: bR = 0; bG = 1; bB = 1 ; break; // シアン
    case 2: bR = 0; bG = 1; bB = 0 ; break; // 緑
    case 1: bR = 0; bG = 0; bB = 1 ; break; // 青
    case 0: bR = 0; bG = 0; bB = 0 ; break; // 黒
    default: bR = 1; bG = 1; bB = 1 ; break; // debug
  }
  // col = color(255, 255, 0, 255);
  pushMatrix();
  translate(start_x, start_y);
  println("\n\nMode: " + mode);
  for (int i =0; i<256; i++) {
    // ビット演算的なもの
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