class Food{
  float rows;
  float cols;
  float x = 60 ;
  float y = 200;
  float rad;
  float w;
  Food(){
    this.rad = 10;
    this.w = 5;
  }
  void ranLocation(){   
    float rows = floor(height/rad);
    float cols = floor(width/rad);   
    this.x = random(cols)*rad;
    this.y = random(rows)*rad;    
    this.x = constrain(this.x,w,width - rad);
    this.y = constrain(this.y,w,height - rad);
  }
  void show(){
    fill(255,0,0);
    rect(x,y,w,w);
  }
 
}
