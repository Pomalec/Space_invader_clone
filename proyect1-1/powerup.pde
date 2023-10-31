public class Power {
 
  float xpos= 90,xspeed = 1, ypos=0, bw=20,bh=10;
  private Power(float xppos){
  
  this.xpos=xppos;
 
  }
  void display() {
    stroke(0);
   pim.resize(80, 80);
    image(pim,xpos,ypos);
    
  }
  void drive() {
    ypos = ypos + xspeed;
  
}

public float getx(){
  return this.xpos;
  }
  public float gety(){
  return this.ypos;
  }
  public float getw(){
  return this.bw;
  }
  public float geth(){
  return this.bh;
  }
 public float gets(){
  return this.xspeed;
  }
   
}
