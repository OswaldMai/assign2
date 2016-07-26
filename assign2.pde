PImage backgroundImg1, backgroundImg2, fighter, hp, treasure, enemy, spTreasure;
PImage st1, st2, end1, end2;
int x,y,a,b,m,n,w,c,d,o,p;
float fighterSpeed = 4;
boolean up = false;
boolean down = false;
boolean left = false;
boolean right = false;
final int START = 0;
final int RUN = 1;
final int LOSE = 2;
int gameState;

void setup () {
  size(640,480) ; 
  st1 = loadImage("img/start1.png");
  st2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  backgroundImg1 = loadImage("img/bg2.png");
  backgroundImg2 = loadImage("img/bg1.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  spTreasure = loadImage("img/Moocs-element-gainbomb.png");
  x = 0;
  y = -640;
  a = 0;
  b = floor(random(420));
  m = floor(random(590));
  n = floor(random(390));
  o = floor(random(590));
  p = floor(random(390));
  w = 40;
  c = 590;
  d = 220;
  gameState = START;

}

void draw() {
  switch (gameState){
    case START:
    image(st2, 0, 0);
    if (mouseY > height*22.8/29 && mouseY < height*25/29 && mouseX > width*5/16 && mouseX < width*11.4/16){
      if (mousePressed){
        gameState = RUN;
      }else{image(st1, 0, 0);}
    }
    break;

    case RUN:
    //background
    if (x > width){x = -640;}
    if (y > width){y = -640;}
    image(backgroundImg1, x, 0);
    image(backgroundImg2, y, 0);
    x = (x+1);
    y = (y+1);
  
    //treasure
    image(treasure,m,n);
    image(spTreasure,o,p);

    //enemy
    image(enemy,a,b);
    a = a+3;
    if (b >d-45){b =b-3;}
    if (b <d+45){b =b+3;}
    if (a >640){b = floor(random(420));}
    a %=640;
  
    //fighter
    image(fighter, c, d);
  
    //fighter control 1
    if (up){d -= fighterSpeed;}
    if (down){d += fighterSpeed;}
    if (left){c -= fighterSpeed;}
    if (right){c += fighterSpeed;}
  
    //fighter boundary detection
    if (c > 590){c = 590;}
    if (c < 0){c = 0;}
    if (d > 430){d = 430;}
    if (d < 0){d = 0;}
  
    //HP
    fill(255,0,0);
    rect(5,3,w,20);
    image(hp,0,0);
  
    //enemy's and treasures' effects
    if (c+51 >= a && c <= a+61 && d+51 >= b && d <= b+61){
      w -= 40;
      a = 0;
      b = floor(random(420));
      }
    if (c+51 >= m && c <= m+41 && d+51 >= n && d <= n+41){
      w +=20;
      m = floor(random(590));
      n = floor(random(390));
      }
    if (c+51 >= o && c <= o+41 && d+51 >= p && d <= p+41){
      fighterSpeed += 1; 
      if (fighterSpeed >= 7){fighterSpeed = 7;}
      o = floor(random(590));
      p = floor(random(390));
      }
    
    //hp's maximum and minimum
    if (w >= 200){w = 200;} 
    if (w <= 0){w=0;}
  
    if (w <= 0){gameState = LOSE;}
    break;
  
    case LOSE:
      image(end2, 0, 0);
      if (mouseY > height*21/33 && mouseY < height*24/33 && mouseX > width*0.95/3 && mouseX < width*2.05/3){
        if (mousePressed){
          w = 40;
          c = 590;
          d = 220;
          fighterSpeed = 4;
          m = floor(random(590));
          n = floor(random(390));
          o = floor(random(590));
          p = floor(random(390));
          gameState = RUN;
        }else{image(end1, 0, 0);}
      }
    break;
  }
}

// fighter control 2
void keyPressed(){
  if (key == CODED){
    switch (keyCode){
      case UP:
        up = true;
        break;
      case DOWN:
        down = true;
        break;
      case LEFT:
        left = true;
        break;
      case RIGHT:
        right = true;
        break;
    }
  }
}
void keyReleased(){
  if (key == CODED){
    switch (keyCode){
      case UP:
        up = false;
        break;
      case DOWN:
        down = false;
        break;
      case LEFT:
        left = false;
        break;
      case RIGHT:
        right = false;
        break;
    }
  }
}
