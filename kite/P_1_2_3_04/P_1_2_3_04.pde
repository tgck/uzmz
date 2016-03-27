// P_1_2_3_04.pde
// 
/**
 * generates a specific color palette and some random "rect-tilings"
 * 
 */

import generativedesign.*;
import processing.opengl.*;
import java.util.Calendar;

int colorCount = 16; // 色の数
int[] hueValues = new int[colorCount];  // 色相
int[] saturationValues = new int[colorCount]; // 彩度
int[] brightnessValues = new int[colorCount]; // 明るさ

int actRandomSeed = 0; // 乱数の種
int rowCount = 7; // 縦の分割数 (0ならランダム、それ以外なら固定)
int counter = 0; // 要素数の数を格納する

int tani_cnt = 0;
boolean bGray = false;
boolean bAnimate = false; // アニメーションさせるかどうか
boolean bShowInfo = false; // デバッグ用表示
boolean bShowStroke = false;
boolean[] bDrawVertex = {true, true, true, true}; // 頂点表示の切替; デバッグ

PFont font;

float THRESH_FRAGMENT_IF_LESS_THAN = 0.075; // 初期値 : フラグメントする確率
//float THRESH_DRAW_IF_LESS_THAN = 0.45; // 初期値 : 描画をスキップしない確率。1なら全描き
float THRESH_DRAW_IF_LESS_THAN = 0.40; // 初期値 : 描画をスキップしない確率。1なら全描き
//int SZ_SHAPE_WIDTH = 400;
int SZ_SHAPE_WIDTH = 80;
//float K_SHAPE_HEIGHT = 1.0; // 要素ブロックの重ね合わせに効く係数
//float K_SHAPE_HEIGHT = 0.9; // 要素ブロックの重ね合わせに効く係数
float K_SHAPE_HEIGHT = 1.127; // 要素ブロックの重ね合わせに効く係数
float th_frg;
float th_draw;

float[] speedByLine = {};
float kSpeed = 0.05;

//////////////////////////////////////////////////
void setup() {
  size(960, 540, OPENGL);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  smooth(8);

  font = loadFont("AmericanTypewriter-Light-22.vlw");
  th_frg = THRESH_FRAGMENT_IF_LESS_THAN;
  th_draw = THRESH_DRAW_IF_LESS_THAN;
}

//////////////////////////////////////////////////
void draw() { 
  background(0,0,0);

  randomSeed(actRandomSeed);

  // ------ colors ------
  if (bGray) {
    //setupGrayPalette(colorCount);
  } else {
    setupPalette(colorCount);
  }

  // ------ area tiling ------

  // row count and row height
  // rowCount = (rowCount == 0) ? (int)random(5,30) : rowCount;
  rowCount = 27;

  // speedByLine を生成
  speedByLine = new float[rowCount+1];
  for (int i=0; i<rowCount+1; i++) {
    speedByLine[i] = random(-1.0, 1.0);
  }

  float rowHeight = (float)height/(float)rowCount;

  pushMatrix(); // メイン表示領域
  if (bShowInfo) translate(0, 79, 0); // デバッグ領域分シフトする
  counter = 0;

  // 縦の行の繰り返し
  // 行ごとに 計算->描画 を繰り返す
  for(int i=rowCount; i>=0; i--) {
    int myIndex = rowCount - i;
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
    // int counter = 0; // タイルの色を決定するために使う
    float sumPartsNow = 0;

    pushMatrix(); // 行ごとの動き
    // int direction = (i % 2 == 0)? 1 : -1;
    //translate(width/2, height/2, 0);
    scale(3.8, 1.0, 1); // はみ出してもだいじょうぶなように引き延ばす
    // translate( direction * tani_cnt, 0, 0); //

    // translate( direction * tani_cnt, 0, 0); // 行ごとにランダムな速さにしたい
    println("rowCount:" + rowCount + ", i:" + i + ", myIndex:" + myIndex);
    translate( speedByLine[myIndex] * tani_cnt * kSpeed, -height/2, 0); // 行ごとにランダムな速さにしたい

    for(int ii=0; ii<parts.length; ii++) {
      sumPartsNow += parts[ii];

      if (random(1.0) < th_draw) {

        //float x = map(sumPartsNow, 0,sumPartsByLine, 0,width)+random(-10,10);
        float x = map(sumPartsNow, 0, sumPartsByLine, 0, width);
        //float y = rowHeight*i+random(-10,10);
        float y = rowHeight*i;

        // float w = map(parts[ii], 0,sumPartsByLine, 0,width)*-1+random(-10,10);
        float w = map(parts[ii], 0,sumPartsByLine, 0,width)*-1;
        // float w = 40; // 固定にした方が面白いかも
        // float w = SZ_SHAPE_WIDTH;
        float h = rowHeight* K_SHAPE_HEIGHT;

        // 基本図形
        drawShape(x, y, w, h, counter);
        // drawShapeTriangle(x, y, w, h, counter);
        // drawShapeCircle(x, y, w, h, counter);

        // デバッグドロー
        if (bShowInfo) drawGuide(x, y);
      } else {
        float x = map(sumPartsNow, 0, sumPartsByLine, 0, width);
        float y = rowHeight*i;
        if (bShowInfo) drawGuideSub(x, y);
      }
      
      counter++;
    } // 同じ行の中の次の図形
    popMatrix();
    popStyle();
  } // 次の行 
  // Filter
  if (bGray) {
    filter(GRAY); // グレーなフィルタ
    filter(BLUR, 3);
  }
  popMatrix(); // メイン表示領域

  // デバッグ情報の表示
  if (bShowInfo) displayInfo();

  if (bAnimate) {
    tani_cnt ++;
    if (tani_cnt % 4440 == 11) {
      actRandomSeed++;
    //  redraw();
    }
  }
} 

// 再描画
void redraw() {
  actRandomSeed = (int) random(100000);

}

