ArrayList <PVector> nodes;
boolean bShowStoredNodes;

void setup(){
  size (400, 400);
  bShowStoredNodes = true;
  nodes = new ArrayList<PVector>();
}

void draw(){
  // 1. bg
  fill(66,66,118,43);
  rect(0, 0, width, height);

  // 2. stored nodes
  if (bShowStoredNodes) drawNodes();

  // 3. pointer
  noFill();
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseReleased(){
   nodes.add(new PVector(mouseX, mouseY));
   println("node size" + nodes.size());  
}

void keyPressed(){
   
   if (key == ' ') { // toggle show mode
      bShowStoredNodes = !bShowStoredNodes;
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
    rect(p.x, p.y, 10, 10);
  }
  popStyle();
}
