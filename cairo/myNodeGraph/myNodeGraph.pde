ArrayList <Node> nodes;
boolean bShowStoredNodes;
boolean bBiggerNode;
boolean bGridSnap;
PImage img;

int RADIUS; // for draw 
final int RADIUS_TO_COLLISION = 20;
final int GRID_SIZE = 20;

int lastId;
Node candidateNodeForLink;
Node draggedNode;

// -------------------------------------------------
void setup(){
  size (292, 484); // 135dpi
  // size (433, 716); // 200dpi
  nodes = new ArrayList<Node>();
  
  lastId = 0;
  // createNodesFromCSV("test.csv");
  
  setupDrawMode();
  bShowStoredNodes = true;
  bBiggerNode = true;
  bGridSnap = false;
  
  // setupImage("a.jpg");
}
void updateDraggedNode(){
  if (draggedNode == null) return;
   draggedNode.pos.x = mouseX;
   draggedNode.pos.y = mouseY;
}

void draw(){
  // 0. update Methods here..
  updateDraggedNode();
  updateNodeRadius();
  
  // 1. bg
  background(66,66,118,43);
  if (img != null) image(img, 0, 0);
  if (bGridSnap) drawGrid();

  // 2. stored nodes
  if (bShowStoredNodes) drawNodes(); // normal drawing

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
  if (bGridSnap) showMessageGridMode();
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
    
   if (key == 'a') {  // switch drawing raduis small/big
      bBiggerNode = !bBiggerNode;
   }
   
   if (key == 'd') { // dump nodes
      dumpNodesInfo();
   }
   if (keyCode == BACKSPACE) {
     // delete a certain node.
     if (candidateNodeForLink != null) {
       removeNode(candidateNodeForLink); // overWrap shiteru node wo sakujo
       candidateNodeForLink = null;
     } else {  // delete last added node.
       removeNode(); 
     }
   }
   if (key == '1') {
     bGridSnap = !bGridSnap; 
   }
}






