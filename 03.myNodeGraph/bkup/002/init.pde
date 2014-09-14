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
 PVector position;
 ArrayList <Integer> links; // contains linked nodes' ids 
 
 Node(){
   id = (int)random(30000); 
   position = new PVector(random(width), random(height));
   links = new ArrayList<Integer>();
 }
 
 Node(int anId, PVector aPv){
    id = anId;
    position = aPv;
 }
 
 void addLink(int id) {
  println("addLink[" + id + "] -- not implemented"); 
 }
 
 void drawLinks(){
  println("drawLinks[" +id + "] -- not implemented");
 }
}
