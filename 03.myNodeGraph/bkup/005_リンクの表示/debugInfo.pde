// 
// debug info 
// 

void showMessageCollision(){
  pushStyle(); 
    fill(220, 220, 12);
    noStroke();
    text("there is a collision", 10, 28);
  popStyle();
}

void showMessageInStack(){
  pushStyle(); 
    fill(220, 220, 12);
    noStroke();
    text("Node[" + candidateNodeForLink.id + "] is in stack.", 10, 44);
  popStyle();
}
