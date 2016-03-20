// P_1_2_3_04.pde
// 
/**
 * generates a specific color palette and some random "rect-tilings"
 * 
 */

import generativedesign.*;
import processing.opengl.*;
import java.util.Calendar;

int colorCount = 7; // 色の数
int[] hueValues = new int[colorCount];  // 色相
int[] saturationValues = new int[colorCount]; // 彩度
int[] brightnessValues = new int[colorCount]; // 明るさ

int actRandomSeed = 0; // 乱数の種
int rowCount = 5; // 縦の分割数 (0ならランダム、それ以外なら固定)

int tani_cnt = 0;
boolean bAnimate = false; // アニメーションさせるかどうか
boolean bShowInfo = false; // デバッグ用表示
boolean bShowStroke = false;
boolean[] bDrawVertex = {true, true, true, true}; // 頂点表示の切替; デバッグ

PFont font;

//float THRESH_FRAGMENT = 0.075;
float THRESH_FRAGMENT_IF_LESS_THAN = 0.075; // 初期値 : フラグメントする確率
float THRESH_DRAW_IF_LESS_THAN = 0.25; // 初期値 : 描画をスキップしない確率。1なら全描き
float th_frg;
float th_draw;

//////////////////////////////////////////////////
void setup() {
  size(800, 800, OPENGL);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  font = loadFont("AmericanTypewriter-Light-22.vlw");
  th_frg = THRESH_FRAGMENT_IF_LESS_THAN;
  th_draw = THRESH_DRAW_IF_LESS_THAN;
}

//////////////////////////////////////////////////
void draw() { 
  background(0,0,0);

  randomSeed(actRandomSeed);

  // ------ colors ------
  setupPalette(colorCount);

  // ------ area tiling ------

  // row count and row height
  rowCount = (rowCount == 0) ? (int)random(5,30) : rowCount;
  float rowHeight = (float)height/(float)rowCount;

  pushMatrix(); // メイン表示領域
  if (bShowInfo) translate(0, 79, 0); // デバッグ領域分シフトする

  // 縦の行の繰り返し
  // 行ごとに 計算->描画 を繰り返す
  for(int i=rowCount; i>=0; i--) {
    // how many fragments
    int partCount = i+1;
    float[] parts = new float[0]; // 長さ0の配列

    for(int ii=0; ii<partCount; ii++) {
      // sub fragments or not?
      if (random(1.0) < th_frg) { 
        // 7.5%の確立で
        // フラグメントする

        // take care of big values   
        int fragments = (int)random(2,20);
        partCount = partCount + fragments; 
        for(int iii=0; iii<fragments; iii++) {
          parts = append(parts, random(2));
        }              
      }  
      else { // 92.5%の確立で。
        parts = append(parts, random(2,20));
      }
    }

    // add all subparts
    float sumPartsByLine = 0;
    for(int ii=0; ii<partCount; ii++) sumPartsByLine += parts[ii];

    
    if (bShowInfo) drawGuideLine(rowHeight*i);

    // ここから描画ロジック
    pushStyle();
    if (bShowStroke) stroke(255);
    int counter = 0; // タイルの色を決定するために使う
    float sumPartsNow = 0;
    for(int ii=0; ii<parts.length; ii++) {
      sumPartsNow += parts[ii];

      if (random(1.0) < th_draw) {
        //float x = map(sumPartsNow, 0,sumPartsByLine, 0,width)+random(-10,10);
        float x = map(sumPartsNow, 0, sumPartsByLine, 0, width);
        //float y = rowHeight*i+random(-10,10);
        float y = rowHeight*i;
        //float w = map(parts[ii], 0,sumPartsByLine, 0,width)*-1+random(-10,10);
        //float w = map(parts[ii], 0,sumPartsByLine, 0,width)*-1;
        //float w = 100; // 固定にした方が面白いかも
        float w = 400;

        //float h = rowHeight*1.5;
        float h = rowHeight*2.9;
        //float h = rowHeight*1.0;

        // 基本図形
        drawShape(x, y, w, h, counter);

        // デバッグドロー
        if (bShowInfo) drawGuide(x, y);
      } else {
        float x = map(sumPartsNow, 0, sumPartsByLine, 0, width);
        float y = rowHeight*i;
        if (bShowInfo) drawGuideSub(x, y);
      }
      
      counter++;
    } // 次の図形
    popStyle();
  } // 次の行 
  popMatrix(); // メイン表示領域

  // デバッグ情報の表示
  if (bShowInfo) displayInfo();

  if (bAnimate) {
    tani_cnt ++;
    if (tani_cnt % 44 == 11) {
      redraw();
    }
  }
} 

// 再描画
void redraw() {
  actRandomSeed = (int) random(100000);
}

