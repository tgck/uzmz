// - setupDrawMode
// Node class
// - makeLinks


import java.util.*;

// ---------------------------------------------------------
//  setupDrawMode
// ---------------------------------------------------------
void setupDrawMode(){
  smooth();
  rectMode(CENTER); 
  ellipseMode(CENTER);
}

// ---------------------------------------------------------
// Node class
// ---------------------------------------------------------
class Node {
 int id;
 PVector pos;
 TreeSet<Integer> linkset; // contains linked nodes' ids
  
 Node(){
   id = (int)random(30000); 
   pos = new PVector(random(width), random(height));
   linkset = new TreeSet<Integer>();
 }
 
 Node(int anId, PVector aPv){
   id = anId;
   pos = aPv;
   linkset = new TreeSet<Integer>();
 }

 void addLinkTo(Node aNode) {
  linkset.add(aNode.id);
 }
 
 void draw(){
   ellipse(pos.x, pos.y, RADIUS, RADIUS);
 }
 
 void drawLinkTo(Node aNode){
   line(pos.x, pos.y, aNode.pos.x, aNode.pos.y);
 }
 
 void drawLinkToPoint(int x, int y){
   line(pos.x, pos.y, x, y);
 }
 
 void unlinkTo(Node aNode){
   linkset.remove(aNode.id);
 }
}

// ---------------------------------------------------------
// makeLinks
//   - manipuration in data layers from outside of Nodes class.
// ---------------------------------------------------------
void makeLinks(Node n1, Node n2){
  if (n1.equals(n2)) return;
  
  n1.addLinkTo(n2);
  n2.addLinkTo(n1);
   
  println ("link made.");
  for (Integer anotherEndId : n1.linkset) {
    println( "node[" + n1.id + "] to " + anotherEndId);
  }
  for (Integer anotherEndId : n2.linkset) {
    println( "node[" + n2.id + "] to " + anotherEndId);
  }
}

// ---------------------------------------------------------
// createNode
//   - manipuration in data layers from outside of Nodes class.
// ---------------------------------------------------------
int createNode() {
  nodes.add(new Node(++currentId,
                     new PVector(mouseX, mouseY)));    
  return nodes.size();
}
// ---------------------------------------------------------

// ---------------------------------------------------------
// removeNodes
//   - manipuration in data layers from outside of Nodes class.
//   - FIXME: delete all links before actual deleteing node.
// ---------------------------------------------------------
void removeNode(Node n) {
  if (nodes.isEmpty() || n == null) return;

  removeAllLinksTo(n);
  nodes.remove(n);
  return;
}

// toku ni shitei ga nakereba saigono node wo kesu.
int removeNode() {
  if (nodes.isEmpty()) return nodes.size();
  
  Node aNode = nodes.get(nodes.size() - 1);
  removeAllLinksTo(aNode);
  nodes.remove(aNode);
  return nodes.size();
}

void removeAllLinksTo(Node n){
  for (Integer anotherEndId : n.linkset) {
    Node linkStartNode = getNodeById(anotherEndId);
    linkStartNode.unlinkTo(n);
  }
}

