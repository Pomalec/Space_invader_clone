public class Bullet {
  float xpos= 90,xspeed = 3, ypos;int bw,bh;
  private Bullet(int yppos,int xppos){
  this.ypos=yppos;
  this.xpos=xppos;
  this.bw=15;
  this.bh=30;
  }
  void display() {
    stroke(0);
   bull.resize(bw, bh);
    image(bull,xpos,ypos);
  }
  void drive() {
    ypos = ypos - xspeed;
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
