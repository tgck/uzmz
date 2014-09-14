import java.util.*;

// ---------------------------------------------------------
void setupDrawMode(){
  smooth();
  rectMode(CENTER); 
  ellipseMode(CENTER);
}

// ---------------------------------------------------------
// Node
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
   rect(pos.x, pos.y, RADIUS, RADIUS);  
 }
 
 void drawLinkTo(Node aNode ){
  line(pos.x, pos.y, aNode.pos.x, aNode.pos.y);
  println("drawingLine.");
 }
}

// ---------------------------------------------------------
// LinkMakers
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
