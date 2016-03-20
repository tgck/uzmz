// パレットを作成する
void setupPalette(int colorCount){
  for (int i=0; i<colorCount; i++) {
    if (i%2 == 0) { // 色相と明度がランダム, 彩度はMAX
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    } 
    else {
      hueValues[i] = 15;  // 青と緑の中間色
      // saturationValues[i] = (int) random(0,20);
      saturationValues[i] = 100;
      brightnessValues[i] = 100;
    }
  }
}