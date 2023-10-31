import gifAnimation.*;

Ship myship;
PImage shipim;
PImage eneim;
PImage bull;
PImage pim;
PImage start;
PImage pause;
PImage boss;
PImage ex;
ArrayList<Bullet> mybullet=new ArrayList<Bullet>();
int kills=0;
ArrayList<Enemy> enes=new ArrayList<Enemy>();
Gif piml;
Boss bo;
ArrayList<Power> p=new ArrayList<Power>();
boolean salive=true;
boolean gameOver = true, pmenu=false;
void setup() {
  size(400, 400);
  kills=enes.size();
  //noCursor();
  ex= loadImage("explosion.jpg");
  shipim= loadImage("ship.png");
   boss= loadImage("boss2.png");
  eneim= loadImage("ene.png");
  bull= loadImage("bu.png");
  piml= new Gif(this, "exxplosion1.gif");
  piml.play();
  piml.ignoreRepeat();
  pim= loadImage("lamp.gif");

  pause= loadImage("pause.png");
  if (mybullet.size()>=1) {
    for (int i = 0; i < mybullet.size(); i++) {
      mybullet.remove(i);
    }
  }
  //if (bo.getnbullet()>=1) {
  //  bo.resetbullet();
  //}
  myship = new Ship();
  createnemy();
  start= loadImage("start.jpg");
  stroke(0);
  start.resize(width, height);
  image(start, 0, 0);
}

void draw() {
  if (gameOver==false) {
    update();
  }
  if (gameOver==true&&pmenu==false) {
    start= loadImage("start.jpg");
    setup();
  }
  if (pmenu) {
    gameOver=true;
    stroke(0);
    pause.resize(width, height);
    image(pause, 0, 0);
  }
  //collision of hit and bullets (adjust collision)
}
void update() {

  background(255);
  fill(0, 408, 612);
  textSize(50);
  kills=(enes.size()/6)+1;//adjust counter
  text(kills, 300, 100);
  createpowerup();
  moveship();
  shoot();
  movenemy();
  collision();
  if(enes.size()==0&&gameOver==false){
  bo.setalive();
  }
}
void mousePressed() {
  //Bullet b= new Bullet(mouseY,mouseX+20);
  mybullet.add(new Bullet(mouseY, mouseX+20));
  //mybullet= (Bullet[]) append(mybullet,b);
  if (pmenu) {
    
  }
}
void createnemy() {
  for (int i =0; i<6; i++) {
    enes.add(new Enemy(10, i*70));
  }
  bo= new Boss(0,200);
}
void keyPressed() {
  if (key==ENTER) {
    gameOver =false;
    salive=true;
    println("start");
  }
  if (key==BACKSPACE) {
    println("pause");
    if (pmenu) {
      pmenu=false;
      gameOver=false;
    } else {
      pmenu=true;
    }
  }
}
void createpowerup() {
  float ran=random(0, 100);
  if (ran>98) {
    println("powerup");
    float xs=random(10, width-50);
    p.add(new Power(xs));
  }
  if (p.size()>=1) {

    for (Power po : p) {
      po.drive();
      po.display();
    }
  }
}
void moveship() {
  myship.drive();
  myship.display();
}
void shoot() {
  for (int i = 0; i < mybullet.size(); i++) {
    Bullet b=mybullet.get(i);
    b.drive();
    b.display();
  }
}
void movenemy() {
  for (int i = 0; i < enes.size(); i++) {
    Enemy ene=enes.get(i);
    ene.drive();
    ene.display();
  }
  if(bo.isalive()){
  bo.drive();bo.display();
  }
}
void collision() {
  if(bo.isalive()){
    if (myship.getx() +myship.getw()  >bo.getx() && myship.getx()< bo.getx() + bo.getw() &&
      myship.gety() + +myship.geth() > bo.gety()&& myship.gety() < bo.gety() + bo.geth()) {
      salive=false;
      myship.dead();
    }
        for (int iz = 0; iz < mybullet.size(); iz++) {
      Bullet b=mybullet.get(iz);
      if (b.getx() +b.getw() + b.gets() >bo.getx() &&
        b.getx() +b.gets() < bo.getx() + bo.getw() &&
        b.gety() +b.geth() + b.gets() > bo.gety()&&
        b.gety() +b.gets() < bo.gety() + bo.geth()) {
        println("hit");
        bo.dead();
        
        if (bo.getcount()>10) {
          gameOver=true;
          
        }
      }
    }
  }
 
  for (int i = 0; i < enes.size(); i++) {
    Enemy ene=enes.get(i);

    if (myship.getx() +myship.getw()  >ene.getx() && myship.getx()< ene.getx() + ene.getw() &&
      myship.gety() + +myship.geth() > ene.gety()&& myship.gety() < ene.gety() + ene.geth()) {
      salive=false;
      myship.dead();
    }

    for (int iz = 0; iz < mybullet.size(); iz++) {
      Bullet b=mybullet.get(iz);
      if (b.getx() +b.getw() + b.gets() >ene.getx() &&
        b.getx() +b.gets() < ene.getx() + ene.getw() &&
        b.gety() +b.geth() + b.gets() > ene.gety()&&
        b.gety() +b.gets() < ene.gety() + ene.geth()) {
        println("hit");
        ene.dead();
        
        if (ene.getcount()>10) {
          
          enes.remove(i);
          
        }
      }
    }
    if (enes.size()==0) {
      print("win");
      //gameOver=true;
    }
    if (salive==false&& myship.getcount()>20) {
      ;
      println("lose");
      gameOver=true;
    }
  }
}
