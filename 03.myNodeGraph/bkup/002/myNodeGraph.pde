ArrayList <PVector> nodes;
boolean bShowStoredNodes;
final int radius = 20;
int currentId;

void setup(){
  size (400, 400);
  bShowStoredNodes = true;
  nodes = new ArrayList<PVector>();
  
  setupDrawMode();
  currentId = 0;
}

void draw(){
  // 1. bg
  background(66,66,118,43);
  //bgcolor(0, 0, width, height);

  // 2. stored nodes
  if (bShowStoredNodes) drawNodes();

  // 3. pointer
  noFill();
  stroke(200, 220, 220);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  ellipse(mouseX, mouseY, radius, radius);
  
  // 4. collision info
  if (anyCollision()) showMessageCollision();
  
}

void mouseReleased(){
   // nodes.add(new PVector(mouseX, mouseY));
   println("node size" + nodes.size());  
}

void keyPressed(){
   
   if (key == ' ') { // toggle show mode
      bShowStoredNodes = !bShowStoredNodes;
   }
   
   if (key == 'a') {
       anyCollision();  // sessioku hantei
   }
   
   if (key == 'd') { // dump nodes
     int i = 0;
     for (PVector p : nodes){
        println ("dump!:[" + i + "]" + " " + (int)p.x + ":" + (int)p.y );
        i++; 
     }
   }
}

void drawNodes() {
  pushStyle();

  fill(220, 220, 12);
  noStroke();
  text("display stored Nodes...", 10, 12);
  
  noFill();
  stroke(220, 220, 12);
  for (PVector p : nodes){
    rect(p.x, p.y, radius, radius);
  }
  popStyle();
}

// contact detection of 2 points.
boolean isOverWrapped(PVector p1, PVector p2, int radius){
  if ( dist(p1.x, p1.y, p2.x, p2.y) <= radius) {
    return true;
  }
  else return false;
}

boolean anyCollision (){
  int cnt = 0;
  for (PVector p : nodes){
    if (isOverWrapped(p, new PVector(mouseX, mouseY), 20)) {
      cnt++; 
    }
  }
  if (cnt == 0) return false;
  else  return true;
}

