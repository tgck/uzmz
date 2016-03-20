// マウスアップでシードを更新
void mouseReleased() {
  actRandomSeed = (int) random(100000);
}

void keyReleased() {  
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_####.png");
  if (key == 'c' || key == 'C') {
    // ------ save an ase file (adobe swatch export) ------
    // create palette
    color[] colors = new color[colorCount];
    for (int i=0; i<colorCount; i++) {
      colors[i] = color(hueValues[i],saturationValues[i],brightnessValues[i]);
    }
    GenerativeDesign.saveASE(this, colors, timestamp()+".ase");
  }
  if (key == 'a') {
    bAnimate = !bAnimate;
  }
  if (key == 'q') {
    bShowInfo = !bShowInfo;
  }
  if (key == 'w') {
    bShowStroke = !bShowStroke;
  }
  if (key == 'r') {
    // Redraw
    redraw();
  }

  // 頂点の描画モード
  if (key == '1') bDrawVertex[0] = !bDrawVertex[0];
  if (key == '2') bDrawVertex[1] = !bDrawVertex[1];
  if (key == '3') bDrawVertex[2] = !bDrawVertex[2];
  if (key == '4') bDrawVertex[3] = !bDrawVertex[3];

  // デバッグパラメータ
  switch (keyCode) {
    case RIGHT:
      th_frg = (th_frg >= 0.0125) ? 0.0125 : th_frg + 0.001; redraw();
      break;
    case LEFT:
      th_frg = (th_frg <= 0.0) ? 0.0 : th_frg - 0.01; redraw();
      break;
    case DOWN:
      th_draw = (th_draw <= 0.0) ? 0.0 : th_draw - 0.01; redraw();
      break;
    case UP:
      th_draw = (th_draw >= 1.0) ? 1.0 : th_draw + 0.01; redraw();
      break;
    default:
      break;
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}

/**
 * generates a specific color palette and some random "rect-tilings"
 * 
 * MOUSE
 * left click          : new composition
 * 
 * KEYS
 * s                   : save png
 * c                   : save color palette
 */