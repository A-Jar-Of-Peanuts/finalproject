import java.awt.Robot; 
import java.util.*; 

int mode = 0; 
final int INTRO = 0; 
final int GAME = 1; 
final int PAUSE = 2;
final int GAMEOVER = 3; 

boolean w, a, s, d, space; 
int gridSize;

color black = #000000;
color white = #FFFFFF;
color dullBlue = #7092BE;

PImage map, mossyStone, oakPlanks, emerald, dirt, log;

PGraphics g, hud;

Player p; 

Robot r; 

//ArrayList<Cube> m = new ArrayList<Cube>(); 
ArrayList<Snowflake> snowList = new ArrayList<Snowflake>(); 
ArrayList<GameObject> bulletList = new ArrayList<GameObject>(); 

HashMap<String, Cube> cubes = new HashMap<String, Cube>();

PImage selected; 

void setup() {
  gridSize = 100; 

  w = false; 
  a = false;
  s = false; 
  d = false; 
  space = false; 

  map = loadImage("map.png"); 
  mossyStone = loadImage("Mossy_Stone_Bricks.png"); 
  oakPlanks = loadImage("Oak_Planks.png");
  emerald = loadImage("emerald.jpg"); 
  dirt = loadImage("dirt.jpg"); 
  log = loadImage("log.jpg"); 
  selected = oakPlanks;

  g = createGraphics(width, height, P3D); 
  hud = createGraphics(width, height, P2D); 

  size(displayWidth, displayHeight, P2D); 

  p = new Player(g, width/2, 9*height/10, height/2, width/2, height/2, height/2-100, 0, 1, 0);

  g.camera(width/2, 9*height/10, height/2, width/2, height/2, height/2-100, 0, 1, 0);

  drawMap();
  drawFloor(-2000, 2000, height, gridSize); 
  //drawFloor(-2000, 2000, height-gridSize*4, gridSize);

  int j = 0;
  while (j < 100) {
    snowList.add( new Snowflake(g) );
    j = j + 1;
  }
}

void draw() {
  switch(mode) {
  case INTRO:
    hud.beginDraw(); 
    hud.clear();
    hud.endDraw(); 
    
    g.beginDraw();
    g.textureMode(NORMAL); 
    g.background(#d8e2dc); 
    g.fill(0); 
    g.textSize(50); 
    g.text("FINAL PROJECT\nPRESS ANYWHERE\nTO START", width/2-500, height/2); 
    g.endDraw(); 


    break;
  case GAME:
    if (frameCount%100==0) {
      bulletList.add(new Enemy(g));
    } 
    if (frameCount%200 == 0) {
      bulletList.add(new HealthPotion(g));
    }
    if (space) {
      bulletList.add(new Bullet(g));
    }
    g.beginDraw();

    g.textureMode(NORMAL);
    g.background(0); 
    g.pointLight(255, 255, 255, p.loc.x, p.loc.y, p.loc.z);

    if (p.lives>0) {
      p.show();
      p.act();
    } else {
      mode = GAMEOVER;
    }

    //Iterator iterator = cubes.entrySet().iterator(); 
    //while(iterator.hasNext()){
    //  Map.Entry mapElement = (Map.Entry)iterator.next(); 
    //  (Cube)mapElement.getValue().show(); 
    //}
    for (Map.Entry entry : cubes.entrySet()) {
      Cube temp = (Cube)entry.getValue(); 
      temp.show(); 
      temp.act();
    }

    int j = 0;
    while (j < 100) {
      Snowflake mySnowflake = snowList.get(j);
      mySnowflake.act();
      mySnowflake.show();
      j = j + 1;
    }

    for (int i = 0; i<bulletList.size(); i++) {
      if (bulletList.get(i).lives > 0) {
        bulletList.get(i).show(); 
        bulletList.get(i).act();
      } else {
        bulletList.remove(i);
      }
    }

    //g.pushMatrix(); 
    //g.fill(0, 255, 0); 
    //g.translate(p.focusx, p.focusy, p.focusz); 
    //g.sphere(10); 
    //g.popMatrix(); 

    g.endDraw();

    hud.beginDraw(); 

    hud.clear();

    crossHair();
    Minimap();

    hud.fill(255); 
    hud.rect(width/2-300, height-100, 600, 100); 
    hud.image(oakPlanks, width/2-300, height-100, 50, 50); 
    hud.image(mossyStone, width/2-200, height-100, 50, 50); 
    hud.image(emerald, width/2-100, height-100, 50, 50); 
    hud.image(dirt, width/2, height-100, 50, 50); 
    hud.image(log, width/2+100, height-100, 50, 50); 

    hud.fill(255); 
    hud.textSize(20); 
    hud.text("1", width/2-300, height-100); 
    hud.text("2", width/2-200, height-100); 
    hud.text("3", width/2-100, height-100); 
    hud.text("4", width/2, height-100); 
    hud.text("5", width/2+100, height-100); 

    hud.text("lives: " + p.lives, width-200, 100); 

    hud.endDraw();

    break;
  case PAUSE:
    break;
  case GAMEOVER:
    cursor(); 
    g.beginDraw(); 
    g.background(0); 
    g.endDraw(); 

    hud.beginDraw();
    hud.clear(); 
    hud.fill(#fec5bb); 
    hud.textSize(100); 
    hud.text("GAMEOVER", width/2-500, height/2); 
    hud.endDraw(); 
    break;
  }
  image(g, 0, 0);
  image(hud, 0, 0);
}

void drawMap() {
  for (int x = 0; x<map.width; x++) {
    for (int y = 0; y<map.height; y++) {
      color c = map.get(x, y); 
      if (c == dullBlue) {
        int row = x*gridSize-2000;
        int col = height-gridSize;
        int depth = y*gridSize-2000;
        String h = row +" "+ col +" "+ depth;

        cubes.put(h, new Cube(g, (float)x*gridSize-2000, (float)height-gridSize, (float)y*gridSize-2000, mossyStone));

        row = x*gridSize-2000;
        col = height-gridSize*2;
        depth = y*gridSize-2000;
        h = row +" "+ col +" "+ depth;

        cubes.put(h, new Cube(g, (float)x*gridSize-2000, (float)height-gridSize*2, (float)y*gridSize-2000, mossyStone));

        row = x*gridSize-2000;
        col = height-gridSize*3;
        depth = y*gridSize-2000;
        h = row +" "+ col +" "+ depth;
        cubes.put(h, new Cube(g, (float)x*gridSize-2000, (float)height-gridSize*3, (float)y*gridSize-2000, mossyStone));
      }
      if (c==black) {
        int row = x*gridSize-2000;
        int col = height-gridSize;
        int depth = y*gridSize-2000;
        String  h = row +" "+ col +" "+ depth;

        cubes.put(h, new Cube(g, (float)x*gridSize-2000, (float)height-gridSize, (float)y*gridSize-2000, oakPlanks));

        row = x*gridSize-2000;
        col = height-gridSize*2;
        depth = y*gridSize-2000;
        h = row +" "+ col +" "+ depth;

        cubes.put(h, new Cube(g, (float)x*gridSize-2000, (float)height-gridSize*2, (float)y*gridSize-2000, oakPlanks));

        row = x*gridSize-2000;
        col = height-gridSize*3;
        depth = y*gridSize-2000;
        h = row +" "+ col +" "+ depth;
        cubes.put(h, new Cube(g, (float)x*gridSize-2000, (float)height-gridSize*3, (float)y*gridSize-2000, oakPlanks));
      }
    }
  }
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255); 
  strokeWeight(1);
  int x = start;
  int z = start;
  while (z<end) {
    int row = x;
    int col = level;
    int depth = z;
    String  h = row +" "+ col +" "+ depth;
    cubes.put(h, new Cube(g, (float)x, (float)level, (float)z, oakPlanks));
    x+=gap;
    if (x>=end) {
      z+=gap; 
      x = start;
    }
  }
}

void crossHair() {
  hud.stroke(white); 
  hud.strokeWeight(5);
  hud.line(width/2-20, height/2, width/2+20, height/2);
  hud.line(width/2, height/2-20, width/2, height/2+20);
}

void Minimap() {
  hud.image(map, 50, 50, 160, 160); 
  int miniX = int(p.loc.x+2000)/gridSize;
  int miniY = int(p.loc.z+2000)/gridSize;

  hud.textSize(20); 
  hud.fill(white);
  hud.text("X: " + miniX, 50, 230); 
  hud.text("Y: " + miniY, 50, 250);

  hud.strokeWeight(0);
  hud.stroke(255, 0, 0); 
  hud.fill(255, 0, 0); 
  hud.rect(miniX*4+50, miniY*4+50, 4, 4);
}
