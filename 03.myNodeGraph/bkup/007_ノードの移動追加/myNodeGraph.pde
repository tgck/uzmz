ArrayList <Node> nodes;
boolean bShowStoredNodes;
boolean bBiggerNode;

int RADIUS; // for draw 
final int RADIUS_TO_COLLISION = 20;

int currentId;
Node candidateNodeForLink;
Node draggedNode;

// -------------------------------------------------
void setup(){
  size (292, 484); // 135dpi
  // size (433, 716); // 200dpi
 
  nodes = new ArrayList<Node>();
  currentId = 0;
  
  setupDrawMode();
  bShowStoredNodes = true;
  bBiggerNode = true;

}
void updateDraggedNode(){
  if (draggedNode == null) return;
   draggedNode.pos.x = mouseX;
   draggedNode.pos.y = mouseY;
}

void draw(){
  // 0. update
  updateDraggedNode();
  updateNodeRadius();
  
  // 1. bg
  background(66,66,118,43);

  // 2. stored nodes
  if (bShowStoredNodes) drawNodes();

  // 3. pointer
  noFill();
  stroke(200, 220, 220, 40);
  line(0, mouseY, width, mouseY);  // guide - left to right
  line(mouseX, 0, mouseX, height); // guide - top to bottom 
  ellipse(mouseX, mouseY, RADIUS, RADIUS);
  
  // 4. links
  drawLinks(); 
  
  // 99. collision info
  if (anyCollision()) showMessageCollision();
  if (candidateNodeForLink != null) showMessageInStack(); 
}

// ---------------------------------------------------------
void mousePressed() {
  
  if (anyCollision()) { // mouse to Node ga overWrapp shiteru toki
    if (keyPressed) {
      if (keyCode == SHIFT) {
         stackNodeMoving(); // Drag the node
      }
    } else {
      stackNodeLinking(); // prompt to make link
    }
  } else { // try to make new node.
    createNode();
  }

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
 
  candidateNodeForLink = null;  // clear the stack
  draggedNode = null; // clear the stack
}

// ---------------------------------------------------------
void keyPressed(){

   if (key == ' ') { // toggle show mode
      bShowStoredNodes = !bShowStoredNodes;
   }
    
   if (key == 'a') {
      bBiggerNode = !bBiggerNode;
   }
   
   if (key == 'd') { // dump nodes
     int i = 0;
     for (Node p : nodes){
        println ("dump!:[" + i + "]" + " " + (int)p.pos.x + ":" + (int)p.pos.y );
        i++; 
     }
   }
}

// ---------------------------------------------------------
// draw nodes.

void drawNodes() {
  pushStyle();

    fill(220, 220, 12);
    noStroke();
    text("display stored Nodes...", 10, 12);
  
    noFill();
    stroke(220, 220, 12);
    
    for (Node n : nodes){ n.draw(); }
    
  popStyle();
}

// ---------------------------------------------------------
// draw links between two nodes.

void drawLinks() {
 pushStyle();
 
 strokeWeight(2);
 //stroke(196, 196, 196, 88);
 stroke(196, 221, 221, 97);
 
 // draw fixed Links
 for (Node n : nodes) {
    if (n.linkset.size() > 0) {
      TreeSet<Integer> t = n.linkset;
      for (Integer anotherEndId : t) {
        if (n.id >= anotherEndId) continue;
        n.drawLinkTo(getNodeById(anotherEndId));
      } 
    } 
 }
 
 // draw dragging links
 if (candidateNodeForLink != null) {
   stroke(255, 221, 221);
   candidateNodeForLink.drawLinkToPoint(mouseX, mouseY);
 }
 
 popStyle(); 
}



