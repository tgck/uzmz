void drawShape(float x, float y, float w, float h, int counter){

    // 四角形: グラデーションあり
    beginShape();

    //// 第一の頂点 : (左上) /////////////////////////////////////////////////
    if (bDrawVertex[0]) {
	    //fill(0,0,0, 255); // 黒のオパーク
	    fill(255,255,255, 255); // 白のオパーク
	    vertex(x,y);
	}
    
    //// 第一の頂点 : (右上) /////////////////////////////////////////////////
    if (bDrawVertex[1]) {
    	vertex(x+w,y);
    }

	//// 第三の頂点 : (右下) /////////////////////////////////////////////////
	int index = counter % colorCount;

    // get component color values + aplha
    if (bDrawVertex[2]) {    
	    fill(hueValues[index]*0.5,saturationValues[index],brightnessValues[index],20);
	    //fill(hueValues[index],saturationValues[index],brightnessValues[index],100);
	    // fillBlack();
	    vertex(x+w,y+h);
	}
    
    //// 第四の頂点 : (左下) /////////////////////////////////////////////////
    if (bDrawVertex[3]) {
	    fill(hueValues[index],saturationValues[index],brightnessValues[index],100);
	    //fill(hueValues[index],saturationValues[index],brightnessValues[index],255);
	    vertex(x,y+h);
    }
    endShape(CLOSE);
}

void drawShapeCircle(float x, float y, float w, float h, int counter) {
	int index = counter % colorCount;
	fill(hueValues[index]*0.5,saturationValues[index],brightnessValues[index],120);
	ellipse( x+w/2, y+h/2, w, h);
}

void drawShapeTriangle(float x, float y, float w, float h, int counter){
	int index = counter % colorCount;

	beginShape();
	fill(255,255,255, 255); // 白のオパーク
	vertex( x + w/2, y);
	fill(hueValues[index]*0.5,saturationValues[index],brightnessValues[index],20);
	vertex( x + w, y+h);
	fill(hueValues[index],saturationValues[index],brightnessValues[index],100);
	vertex( x, y+h);
	endShape();
}