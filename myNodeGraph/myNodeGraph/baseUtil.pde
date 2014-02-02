// - setupDrawMode
// Node class
// - makeLinks

import java.util.*;

// 
//
//
void setupImage(String filename){
   img = loadImage(filename); 
}

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
 PVector posSnapped; // snapped position
 TreeSet<Integer> linkset; // contains linked nodes' ids
  
 Node(){
   id = (int)random(30000); 
   pos = new PVector(random(width), random(height));
   posSnapped = pos.get();
   linkset = new TreeSet<Integer>();
 }
 
 Node(int anId, PVector aPv){
   id = anId;
   pos = aPv;
   posSnapped = aPv.get(); // sansyou ga kabutteshimaunode aPv tosuruto dame.
   linkset = new TreeSet<Integer>();
 }
 
 void update() {
    // self update for "Grid Snapp Drawing Mode" 
    posSnapped.x = round( pos.x / GRID_SIZE) * GRID_SIZE;
    posSnapped.y = round( pos.y / GRID_SIZE) * GRID_SIZE;
 }

 void addLinkTo(Node aNode) {
  linkset.add(aNode.id);
 }
 
 void draw(){
   //ellipse(pos.x, pos.y, RADIUS, RADIUS);
   ellipse(pos().x, pos().y, RADIUS, RADIUS);
 }
 
 void drawLinkTo(Node aNode){
   //line(pos.x, pos.y, aNode.pos.x, aNode.pos.y);
   line(pos().x, pos().y, aNode.pos().x, aNode.pos().y);
 }
 
 void drawLinkToPoint(int x, int y){
   //line(pos.x, pos.y, x, y);
   line(pos().x, pos().y, x, y);
 }
 
 void unlinkTo(Node aNode){
   linkset.remove(aNode.id);
 }

 // modified for GRID SNAP MODE
 PVector pos(){
   if (!bGridSnap) { return pos; }  
   else {
     update(); // TODO: koko de yobu ka douka ha kenntou...
     return posSnapped;
   }  
 }
 
 //
 // debug
 //
 void dump(){ 
   String linkstr = "";
   
   if ( !linkset.isEmpty()) {
     // make int array and then join into one string.
     int tmpArr[] = new int[linkset.size()];
     
     int i = 0;
     Iterator itr = linkset.iterator();
     while (itr.hasNext()){
       tmpArr[i] = ((Integer)itr.next()).intValue(); 
       i++; 
     }
     linkstr = join(nf(tmpArr, 0), ":");
   }
   println (id + "," 
         + (int)pos().x + "," 
         + (int)pos().y + ","
         + linkstr); 
 }
}

void createNodesFromCSV(String filename){
  Table table = loadTable(filename, "header");
  println(table.getRowCount() + " total rows in file[" + filename + "]"); 
  
  // load file
  for (TableRow row : table.rows()) {
    
    int id = row.getInt("id");
    PVector p = new PVector(row.getInt("position_x"), row.getInt("position_y"));
    String linkstr = row.getString("linkset");
    // println("nodes:" + id);
    
    Node tmpNode = new Node(id, p);
    
    // add Link (int)
    if (linkstr.isEmpty()) continue;
    
    String[] list = split(linkstr, ":");
    for (String aStr : list){
      // println("elements:" + aStr);
      tmpNode.linkset.add(Integer.parseInt(aStr));
    } 
    nodes.add(tmpNode);
  }
  // update indexer
  lastId = nodes.get(nodes.size()-1).id;
}
// ---------------------------------------------------------
// makeLinks
//   - manipuration in data layers from outside of Nodes class.
// ---------------------------------------------------------
void makeLinks(Node n1, Node n2){
  if (n1.equals(n2)) return;
  
  n1.addLinkTo(n2);
  n2.addLinkTo(n1);
  
  // TODO: links set before should not be printed.
  println ("link made.");
  for (Integer anotherEndId : n1.linkset) {
    println( "--> node[" + n1.id + "] to " + anotherEndId);
  }
  for (Integer anotherEndId : n2.linkset) {
    println( "<-- node[" + n2.id + "] to " + anotherEndId);
  }
}

// ---------------------------------------------------------
// createNode
//   - manipuration in data layers from outside of Nodes class.
// ---------------------------------------------------------
int createNode() {
  nodes.add(new Node(++lastId,
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

