void drawShapeCircle(float x, float y, float w, float h, int counter) {
	int index = counter % colorCount;
	// fill(hueValues[index]*0.5,saturationValues[index],brightnessValues[index],120);
	ellipse( x, y, w, h);
}
