
// boolean isOverWrapped(PVector p1, PVector p2, int radius)  
//     --- use this first
// boolean anyCollision ()  
//     --- kei zentai wo check.
// Node getOverWrappedNodeWithMouse()
//     --- mouse ni taishite tukau. for MouseEventHandler


// ---------------------------------------------------------
// contact detection of 2 points.
boolean isOverWrapped(PVector p1, PVector p2, int radius){
  if ( dist(p1.x, p1.y, p2.x, p2.y) <= radius) {
    return true;
  }
  else return false;
}
// ---------------------------------------------------------
boolean anyCollision (){
  int cnt = 0;
  for (Node n : nodes){
    if (isOverWrapped(n.pos, new PVector(mouseX, mouseY), RADIUS_TO_COLLISION)) {
      cnt++; 
    }
  }
  return (cnt == 0 ? false : true);
}
// ---------------------------------------------------------
Node getOverWrappedNodeWithMouse(){
  Node overWrappedNode = new Node();
  int cnt = 0;
  
  for (Node n : nodes){
    if (isOverWrapped(n.pos, new PVector(mouseX, mouseY), RADIUS_TO_COLLISION)) {
      overWrappedNode = n;
      cnt++;
    }
  }
  assert cnt > 0 : "Exception: There is no overwapped node at [getOverWrappedNode]";
  return overWrappedNode;
}

// ---------------------------------------------------------
// Node handling utils
// ---------------------------------------------------------
int createNode() {
  nodes.add(new Node(++currentId,
                     new PVector(mouseX, mouseY)));    
  return nodes.size();
}
// ---------------------------------------------------------
void stackNodeLinking() {
  candidateNodeForLink = getOverWrappedNodeWithMouse();
  println ("mouse caught a Node[" + candidateNodeForLink.id + "] in stack.");
  return;
}
// ---------------------------------------------------------
void stackNodeMoving() {
  draggedNode = getOverWrappedNodeWithMouse();
  println ("mouse caught a Node[" + draggedNode.id + "] in stack.");
  return;
}
// ---------------------------------------------------------
Node getNodeById(int targetId) {
  for (Node n : nodes) {
    if (n.id == targetId) return n;
  }
  assert false: "can't find Node[" + targetId + "]";
  return new Node(); 
}
