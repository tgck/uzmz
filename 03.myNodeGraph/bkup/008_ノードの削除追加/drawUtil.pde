// drawUtil - methods for presentations.
//   - updateNodeRadius 
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
// drawLinks
//   draw every fixed links. reffers every nodes' link information.
//   also draws unfixed link (between stacked node and mouse point)
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


