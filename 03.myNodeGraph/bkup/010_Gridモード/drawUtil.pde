// drawUtil - all about presentations!
//   - updateNodeRadius
//   - drawGrid
//   - drawNodes
//   - drawLinks


// ---------------------------------------------------------
// updateNodeRadius 
//   Switching method for Nodes' presentation.
// ---------------------------------------------------------
void updateNodeRadius(){
   if (bBiggerNode) RADIUS = 20;
   else RADIUS = 4; 
}

// ---------------------------------------------------------
// drawGrids
// ---------------------------------------------------------
void drawGrid() {
  pushStyle();

    // draw fixed Links
    strokeWeight(1);
    stroke(196, 221, 221, 97); 
    
    int posY = 0; // horizontal line
    while (posY < height) { // from top -> bottom
      line(0, posY, width, posY);
      posY += GRID_SIZE; 
    }
    int posX = 0; // vertical line
    while (posX < width) { // from left -> right
      line(posX, 0, posX, height);
      posX += GRID_SIZE;
    }
    
  popStyle();
}

// ---------------------------------------------------------
// drawNodes
//  - draw all nodes. (presentation)
// ---------------------------------------------------------
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
// drawLinks
//   - draw every fixed links. reffers every nodes' link information.
//   - also draws unfixed link (between stacked node and mouse point)
// ---------------------------------------------------------
void drawLinks() {
 pushStyle();
 
   // draw fixed Links
   strokeWeight(2);
   stroke(196, 221, 221, 97); 

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


