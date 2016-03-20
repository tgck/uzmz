void drawShape(float x, float y, float w, float h, int counter){

    // 四角形: グラデーションあり

    beginShape();

    //// 第一の頂点 : (左上) /////////////////////////////////////////////////

    //fill(0,0,0, 255); // 黒のオパーク
    fill(255,255,255, 255); // 白のオパーク
    vertex(x,y);
    
    //// 第一の頂点 : (右上) /////////////////////////////////////////////////

    vertex(x+w,y);


	//// 第三の頂点 : (右下) /////////////////////////////////////////////////

    // get component color values + aplha
    int index = counter % colorCount;
    fill(hueValues[index]*0.5,saturationValues[index],brightnessValues[index],20);
    //fill(hueValues[index],saturationValues[index],brightnessValues[index],100);

    // fillBlack();
   
    vertex(x+w,y+h);
    
    //// 第四の頂点 : (左下) /////////////////////////////////////////////////

    fill(hueValues[index],saturationValues[index],brightnessValues[index],100);
    //fill(hueValues[index],saturationValues[index],brightnessValues[index],255);
    vertex(x,y+h);
    
    endShape(CLOSE);
}


void fillBlack(){
	fill(0,0,0, 255); // 黒のオパーク
}
void fillGreen(){
	fill(0,0,255,255);
}

void displayInfo(){
	pushStyle();
	pushMatrix();
	// colorCount
	// hueValues
	// saturationValues
	// brightnessValues
	int offset_x = 10;
	int offset_y = 10;
	int block_size = 20;
	int interval = 10;

	fillGreen();
	noStroke();
	rect(0,0,width,40); // 高さ 40 の領域 を背景として塗り

	int x = offset_x;
	int y = offset_y;

	for (int i=0; i<colorCount; i++){
		// fillBlack();
		fill(hueValues[i], saturationValues[i], brightnessValues[i]);
		rect(x, y, block_size, block_size);
		x = ( x + block_size) + interval;
	}
	popMatrix();
	popStyle();
}
