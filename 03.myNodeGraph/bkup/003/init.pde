void setupDrawMode(){
  smooth();
  rectMode(CENTER); 
  ellipseMode(CENTER);
}

// debugs
void showMessageCollision(){
  pushStyle(); 

  fill(220, 220, 12);
  noStroke();
  text("there is a collision", 10, 28);
  
  popStyle();
}

// misiyou
class Node {
 int id;
 PVector pos;
 ArrayList <Integer> links; // contains linked nodes' ids 
 
 Node(){
   id = (int)random(30000); 
   pos = new PVector(random(width), random(height));
   links = new ArrayList<Integer>();
 }
 
 Node(int anId, PVector aPv){
   id = anId;
   pos = aPv;
   links = new ArrayList<Integer>();
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
