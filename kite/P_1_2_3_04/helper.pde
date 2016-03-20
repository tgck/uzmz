void fillBlack(){
	fill(0,0,0, 255); // 黒のオパーク
}
void fillGreen(){
	fill(0,0,255,255);
}

void displayInfo(int counter, int rowCount){
	pushStyle();
	pushMatrix();

	int offset_x = 10;
	int offset_y = 10;
	int block_size = 20;
	int interval = 10;
	int lf = 13;
	int a_height = 10 + offset_y + block_size + 3*lf;

	// background
	fillGreen();
	noStroke();
	rect(0,0,width, a_height);

	// color palette
	int x = offset_x;
	int y = offset_y;

	for (int i=0; i<colorCount; i++){
		// fillBlack();
		fill(hueValues[i], saturationValues[i], brightnessValues[i]);
		rect(x, y, block_size, block_size);
		x = ( x + block_size) + interval;
	}

	// value for color palette
	noStroke(); 
	fillBlack();
	textFont(font, 12);
	textAlign(RIGHT);
	x = offset_x;
	y = offset_y + block_size + 10;

	for (int i=0; i<colorCount; i++){
		String[] l = {nf(hueValues[i],0), nf(saturationValues[i],0), nf(brightnessValues[i],0) };
		text(join( l, "\n" ), x+block_size, y);
		x = ( x + block_size) + interval;
	}

	// 中段
	String str_ct = "FRAGMENT: " + nf(THRESH_FRAGMENT_IF_LESS_THAN,1,3) + "\n" 
		+ "DRAW: " + nf(THRESH_DRAW_IF_LESS_THAN, 1,3);
	text(str_ct, width/2 + 20, y);

	// 右段
	String str_rt = "Counter: " + nf(counter,0) + "\n" + "rowCount: " + nf(rowCount,0);
	text(str_rt, width - 10, y);

	popMatrix();
	popStyle();
}

// 横線
void drawGuide(float x, float y){
  pushStyle();
  // 検証用ホリゾンバー
  stroke(0,255,255,255);
  line(x,y,width,y);

  // 検証用マーカー
  //  フレームのキーとなる座標に赤点を置く
  fill(0,255,255,255);
  ellipse(x,y,6,6);
  popStyle();
}
// 横線
void drawGuideSub(float x, float y){
  pushStyle();
  // 検証用マーカー
  //  フレームのキーとなる座標に赤点(薄い)を置く
  noFill();
  stroke(0,255,255,255);
  ellipse(x,y,6,6);
  popStyle();
}