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

void showMessageGridMode(){
  pushStyle(); 
    fill(220, 220, 12);
    noStroke();
    text("Grid Snap On", 10, 60);
  popStyle();
}

void dumpNodesInfo(){
  int i = 0;
  println("dumpNodesInfo:" + nodes.size() + " nodes.");
  println("------------------------------------------");
  println("id,position_x,position_y,linkset"); // CSV header
  for (Node n : nodes) {n.dump();} 
  println("------------------------------------------");  
}
