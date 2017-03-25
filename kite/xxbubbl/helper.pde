void fillBlack(){
	fill(0,0,0, 255); // 黒のオパーク
}
void fillGreen(){
	fill(0,0,255,255);
}

// デバッグ情報の表示
void displayInfo(){
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
	String str_ct = 
		"FRAGMENT:  " + nf(th_frg,1,3) + "\n" 
		+ "DRAW:  " + nf(th_draw, 1,3) + "\n"
		+ "SZ_SHAPE_W:  " + nf(SZ_SHAPE_WIDTH, 0) + "\n"
		+ "K_SHAPE_H:  "  + nf(K_SHAPE_HEIGHT, 1, 2);

	text(str_ct, width/2 + 20, 10);

	// 右段
	String str_rt = "rowCount: " + nf(rowCount,0)
		+ "\n" + "counter: " + nf(counter, 0);
	if (bAnimate) str_rt += "\n A";
	text(str_rt, width - 10, y);

	popMatrix();
	popStyle();
}

// 検証用ホリゾンバー
void drawGuideLine(float y){
	pushStyle();
  	stroke(0,255,255,255);
  	line(0,y,width,y);
	popStyle();
}

// デバッグ用に、要素図形のアウトラインを描く
void drawGuide(float x, float y){
  pushStyle();
  // 検証用マーカー
  //  フレームのキーとなる座標に赤点を置く
  fill(0,255,255,255);
  ellipse(x,y,6,6);
  popStyle();
}

// デバッグ用に、要素図形のアウトラインを描く。非表示図形用。
void drawGuideSub(float x, float y){
  pushStyle();
  // 検証用マーカー
  //  フレームのキーとなる座標に赤点(薄い)を置く
  noFill();
  stroke(0,255,255,255);
  ellipse(x,y,6,6);
  popStyle();
}