public class Ship {
  boolean move=true;
  float xpos=mouseX;
  int bu=8, w, h;
  float ypos=mouseY;boolean alive=true;int count=0;
  private Ship() {
    this.w=60;
    this.h=30;
  }
  public void display() {
    stroke(0);
    shipim.resize(w, h);
    if(alive){image(shipim, xpos, ypos);}else{image(piml,xpos,ypos-20);}
    
  }
  public void drive() {//adjust colision with boundaries
    if (move) {
      xpos = mouseX;
      ypos=mouseY;
    }
    if (mouseX+w>width) {
      move=false;
      println("e");
    } else{
    if(xpos<width){
    move=true;
    println("a");
    println(mouseX+w);
     println(width);
  }
    }
    if (mouseY+h>height) {
      move=false;
      println("e");
    } else{
    if(ypos<height){
    move=true;
    println("a");
    println(mouseX+w);
     println(width);
  }
    
    }
    
    
  }
  void dead(){
piml.play();
    count++;
    alive=false;
}
  public float getx() {
    return this.xpos;
  }
  public float gety() {
    return this.ypos;
  }
  public float getw() {
    return this.w;
  }
  public float geth() {
    return this.h;
  }
   public int getcount(){
  return this.count;
  }
}
