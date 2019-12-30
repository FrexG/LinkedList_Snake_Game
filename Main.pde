SnakeList slist;
//Snake snake;
Food fd;
float xdiff = 0;
void setup(){
  size(400,400);
  frameRate(10);
  fd = new Food();
 // snake = new Snake();
  slist = new SnakeList(new PVector(50,60)); 
}
void draw(){
  
  background(0,0,255);  
  fd.show();     
  
  if(keyPressed){
    if(slist.ySpeed == 0){
      if(keyCode == UP){
        slist.dir(0,-1);
      }
      if(keyCode == DOWN){
        slist.dir(0,1);
      }
    }
    if(slist.xSpeed == 0){
      if(keyCode == LEFT){
        slist.dir(-1,0);
      }
      if(keyCode == RIGHT){
        slist.dir(1,0);
      }
    }
  }
    if(slist.isEaten(fd)){
      //println("True");
    fd.ranLocation();
    slist.addLast(new PVector(slist.head.v.x,slist.head.v.y)); 
  }
  slist.update();
  slist.show();
  slist.collision();
}

  
    
