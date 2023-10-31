abstract class Entity {
  float xpos,xspeed, ypos; int w,h;boolean alive=true;int count=0;int type;
 
  //void display() {
    
  //  eneim.resize(w, h);
  //  boss.resize(w, h);
  //  if(alive&&type==1){image(eneim,xpos,ypos);
  //  }
  //  if(alive&&type==0){image(boss,xpos,ypos);
  //  }
  //  if(alive==false){stroke(0);image(piml,xpos,ypos-20);println("uwu");}
  //}
  void drive() {
    if (alive){
    ypos = ypos + xspeed;}
}
void dead(){
piml.play();
    count++;
    alive=false;
    
}
 public float getx(){
  return this.xpos;
  }
  public float gety(){
  return this.ypos;
  }
  public float getw(){
  return this.w;
  }
  public float geth(){
  return this.h;
  }
 public float gets(){
  return this.xspeed;
  }
   public int getcount(){
  return this.count;
  }
  public boolean isalive(){
   return this.alive; 
  }
}
