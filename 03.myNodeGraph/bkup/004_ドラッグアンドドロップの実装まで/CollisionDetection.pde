
// boolean isOverWrapped(PVector p1, PVector p2, int radius)  
//     --- use this first
// boolean anyCollision ()  
//     --- kei zentai wo check.
// Node getOverWrappedNodeWithMouse()
//     --- mouse ni taishite tukau. for MouseEventHandler


// contact detection of 2 points.
boolean isOverWrapped(PVector p1, PVector p2, int radius){
  if ( dist(p1.x, p1.y, p2.x, p2.y) <= radius) {
    return true;
  }
  else return false;
}
boolean anyCollision (){
  int cnt = 0;
  for (Node p : nodes){
    if (isOverWrapped(p.pos, new PVector(mouseX, mouseY), radius)) {
      cnt++; 
    }
  }
  if (cnt == 0) return false;
  else  return true;
}

Node getOverWrappedNodeWithMouse(){
  Node overWrappedNode = new Node();
  int cnt = 0;
  
  for (Node n : nodes){
    if (isOverWrapped(n.pos, new PVector(mouseX, mouseY), radius)) {
      overWrappedNode = n;
      cnt++;
    }
  }
  assert cnt > 0 : "Exception: There is no overwapped node at [getOverWrappedNode]";
  return overWrappedNode;
}

int createNode() {
  nodes.add(new Node(++currentId,
                     new PVector(mouseX, mouseY)));    
  return nodes.size();
}
