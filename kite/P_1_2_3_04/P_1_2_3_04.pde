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
int tani_cnt = 0;
boolean bAnimate = true; // アニメーションさせるかどうか

//////////////////////////////////////////////////
void setup() {
  size(800, 800, OPENGL);  // OPENGL
  colorMode(HSB, 360, 100, 100);  // HSV
  noStroke();
}

//////////////////////////////////////////////////
void draw() { 
  background(0,0,0);

  randomSeed(actRandomSeed);
  println("aaa" + actRandomSeed);

  // ------ colors ------
  // create palette 毎フレームカラーパレット作ってる
  for (int i=0; i<colorCount; i++) {
    if (i%2 == 0) {
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    } 
    else {
      hueValues[i] = 15;  // 青から緑
      // saturationValues[i] = (int) random(0,20);
      saturationValues[i] = 100;
      brightnessValues[i] = 100;
    }
  }

  // ------ area tiling ------
  // count tiles
  int counter = 0;
  // row count and row height
  int rowCount = (int)random(5,30);
  println("rowCount" + rowCount);
  float rowHeight = (float)height/(float)rowCount;

  // seperate each line in parts  
  for(int i=rowCount; i>=0; i--) {
    // how many fragments
    int partCount = i+1;
    float[] parts = new float[0];

    for(int ii=0; ii<partCount; ii++) {
      // sub fragments or not?
      if (random(1.0) < 0.075) {
        // take care of big values   
        int fragments = (int)random(2,20);
        partCount = partCount + fragments; 
        for(int iii=0; iii<fragments; iii++) {
          parts = append(parts, random(2));
        }              
      }  
      else {
        parts = append(parts, random(2,20));   
      }
    }

    // add all subparts
    float sumPartsTotal = 0;
    for(int ii=0; ii<partCount; ii++) sumPartsTotal += parts[ii];

    // draw rects
    float sumPartsNow = 0;
    for(int ii=0; ii<parts.length; ii++) {
      sumPartsNow += parts[ii];

      if (random(1.0) < 0.45) {
        //float x = map(sumPartsNow, 0,sumPartsTotal, 0,width)+random(-10,10);
        float x = map(sumPartsNow, 0,sumPartsTotal, 0,width);
        //float y = rowHeight*i+random(-10,10);
        float y = rowHeight*i;
        //float w = map(parts[ii], 0,sumPartsTotal, 0,width)*-1+random(-10,10);
        //float w = map(parts[ii], 0,sumPartsTotal, 0,width)*-1;
        //float w = 100; // 固定にした方が面白いかも
        float w = 400;

        //float h = rowHeight*1.5;
        //float h = rowHeight*2.9;
        float h = rowHeight*1.0;


        // ここが肝なのかも - 四角形のグラデーション
        beginShape();

        //fill(0,0,0, 255); // 黒のオパーク
        fill(255,255,255, 255); // 白のオパーク
        vertex(x,y);  // 第一の頂点
        
        vertex(x+w,y);  // 第二の頂点

        // get component color values + aplha
        int index = counter % colorCount;
        //fill(hueValues[index]*0.5,saturationValues[index],brightnessValues[index],20);
        //fill(hueValues[index],saturationValues[index],brightnessValues[index],100);
        fill(0,0,0, 255); // 黒のオパーク
        vertex(x+w,y+h);  // 第三の頂点 
        
        //fill(hueValues[index],saturationValues[index],brightnessValues[index],100);
        //fill(hueValues[index],saturationValues[index],brightnessValues[index],255);
        //vertex(x,y+h);    // 第四の頂点
        
        endShape(CLOSE);
        // ここまで肝なのかも

        // 検証用マーカー。フレームのキーとなる座標に赤点を置く
        fill(0,255,255,255);
        ellipse(x,y,6,6);

      }

      counter++;
    }

    //actRandomSeed = (int) random(100000);
    if (bAnimate) {
      tani_cnt ++;
      if (tani_cnt % 444 == 111) {
        actRandomSeed = (int) random(100000);
      }
    }
  }  
} 



