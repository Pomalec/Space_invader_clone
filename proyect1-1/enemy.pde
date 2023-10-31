
public class Enemy extends Entity{
 
  private Enemy(int yppos,int xppos){
  this.ypos=yppos;
  this.xpos=xppos;
  this.w=60;
  this.h=30;
  this.type=1;
  this.xspeed=1;
  }
  void display() {
    
    eneim.resize(w, h);
    boss.resize(w, h);
    if(alive&&type==1){image(eneim,xpos,ypos);
    }
    if(alive&&type==0){image(boss,xpos,ypos);
    }
    if(alive==false){stroke(0);image(piml,xpos,ypos-20);println("uwu");}
  }
  
}

class Boss extends Enemy{
ArrayList<Bullet> eb=new ArrayList<Bullet>();
Boss(int x,int y){
super(x,y);
alive=false;
type=0;
}
public int getnbullet(){
return eb.size();
}
void resetbullet(){
for (int i = 0; i < eb.size(); i++) {
      eb.remove(i);
    }
}
void setalive(){
alive=true;
}
}
