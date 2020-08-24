
class SnakeList{ 
  float xSpeed = 1;
  float ySpeed = 0;
  float w = 10;
  Node head = null;
  Node tail = null;
  int size = 0;
  int maxSize = 200;
  //Linked List Internal node class
  private class Node{
    Node next;
    Node prev;
    PVector v;
    public Node(PVector v, Node next,Node prev){
      this.v = v;
      this.next = next;
      this.prev = prev;
    }
  }
  //Constructor,
  //Initialise the head
  public SnakeList(PVector headSnake){
    this.head = this.tail = new Node(headSnake,null,null);
    size++;
  }
  // return the size of list
  public int Size(){
    return size;
  }
  //Check if the list is empty
  public boolean isEmpty(){
    return Size() == 0;
  }
  //Add to the tail of the list
  public void addLast(PVector tailSnake){
    if(Size() <= maxSize){
      Node thisNode = new Node(tailSnake,null,this.tail);
      this.tail.next = thisNode;
      this.tail = thisNode;
      size++;
      //println(size);
    }
  }
  //Draw the Snake,
  //starting from the tail to head
  public void show(){
    stroke(0);
    fill(118,195,100);
    Node current = tail;
    while(current != head){
      rect(current.v.x,current.v.y,w,w);            
      current = current.prev;
    }   
    
    rect(head.v.x,head.v.y,w,w);
  }
  //update value
  public void update(){
    Node current = tail;
    while(current.prev != null){
      current.v = new PVector(current.prev.v.x,current.prev.v.y);   
            
      current = current.prev;
    }
    head.v.x += xSpeed*w;
    head.v.y += ySpeed*w;
   
    
    if(head.v.x <= 0) head.v.x = width - 1;
    if(head.v.x >= width) head.v.x = 1;
    
    if(head.v.y <= 0) head.v.y = height - 1;
    if(head.v.y >= height) head.v.y = 1;

  }
  public void dir(float x,float y){
    xSpeed = x;
    ySpeed = y;
  }
  //Check if the food is eaten
  boolean isEaten(Food f){    
        return floor(abs(dist(f.x,f.y,head.v.x + 5 ,head.v.y + 5))) <= 10;
    }
  public void collision(){
    Node current = tail;
    while(current.prev != null){
      if(dist(current.v.x,current.v.y,head.v.x,head.v.y) == 0){
        println("Game Over!!!");
        println("You're Score is: "+Size());
        exit();
      }
            
      current = current.prev;
    }
    
  }
  
}
