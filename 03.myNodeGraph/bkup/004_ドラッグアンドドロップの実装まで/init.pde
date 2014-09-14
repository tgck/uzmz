import java.util.*;

// -------------------------------------------
void setupDrawMode(){
  smooth();
  rectMode(CENTER); 
  ellipseMode(CENTER);
}

// -------------------------------------------
// Node
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
 
 void draw(){
   rect(pos.x, pos.y, radius, radius);  
 }
 
 void addLink(int id) {
  println("addLink[" + id + "] -- not implemented"); 
 }
 
 void drawLinks(){
  println("drawLinks[" +id + "] -- not implemented");
 }
}

// -------------------------------------------
// LinkMakers
void makeLinks(Node n1, Node n2){
  if (n1.equals(n2)) return;
  
  n1.linkset.add(n2.id);
  n2.linkset.add(n1.id);
   
  println ("link made.");
  for (Integer anotherEndId : n1.linkset) {
    println( "node[" + n1.id + "] to " + anotherEndId);
  }
  for (Integer anotherEndId : n2.linkset) {
    println( "node[" + n2.id + "] to " + anotherEndId);
  }
   
}
