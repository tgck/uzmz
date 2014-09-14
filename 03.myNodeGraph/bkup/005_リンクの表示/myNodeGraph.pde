
ArrayList <Node> nodes;
boolean bShowStoredNodes;
final int RADIUS = 20;
int currentId;
Node candidateNodeForLink;

void setup(){
  size (400, 400);
  bShowStoredNodes = true;
  nodes = new ArrayList<Node>();
  
  setupDrawMode();
  currentId = 0;
}

void draw(){
  // 1. bg
  background(66,66,118,43);

  // 2. stored nodes
  if (bShowStoredNodes) drawNodes();

  // 3. pointer
  noFill();
  stroke(200, 220, 220);
  line(0, mouseY, width, mouseY);
  line(mouseX, 0, mouseX, height);
  ellipse(mouseX, mouseY, RADIUS, RADIUS);
  
  // 4. links
  drawLinks(); 
  
  // 99. collision info
  if (anyCollision()) showMessageCollision();
  if (candidateNodeForLink != null) showMessageInStack(); 
}

// ---------------------------------------------------------
void mouseReleased(){
  if (anyCollision()) { // try to make link with stacked node.
    
    if (candidateNodeForLink != null) { // dragging from other end node.
      makeLinks(candidateNodeForLink, getOverWrappedNodeWithMouse());
    }
    
  } else {
   ; 
  }
  
  candidateNodeForLink = null; // clearing the stack
}

// ---------------------------------------------------------
void mousePressed() {
  
  if (anyCollision()) { // mouse to Node ga overWrapp shiteru toki
    stackNode(); 
  } else { // try to make new node.
    createNode();
  } 

}

// ---------------------------------------------------------
void keyPressed(){

  if (key == ' ') { // toggle show mode
      bShowStoredNodes = !bShowStoredNodes;
   }
   
   if (key == 'a') {
       anyCollision();  // sessioku hantei
   }
   
   if (key == 'd') { // dump nodes
     int i = 0;
     for (Node p : nodes){
        println ("dump!:[" + i + "]" + " " + (int)p.pos.x + ":" + (int)p.pos.y );
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
  for (Node p : nodes){
    p.draw();
  }
  popStyle();
}

void drawLinks() {
 pushStyle();
 
 strokeWeight(1);
 stroke(196, 196, 196, 88);
 
 for (Node n : nodes) {
    if (n.linkset.size() > 0) {
      TreeSet<Integer> t = n.linkset;
      for (Integer anotherEndId : t) {
        if (n.id >= anotherEndId) continue;
        n.drawLinkTo(getNodeById(anotherEndId));
      } 
    } 
 }
 popStyle(); 
}

