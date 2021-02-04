void keyPressed() {
  switch(mode) {
  case INTRO:
    break;
  case GAME:
    switch(key) {
    case 'w':
      w = true; 
      break; 
    case 'a':
      a = true; 
      break;
    case 's':
      s = true; 
      break;
    case 'd':
      d = true; 
      break;
    case ' ':
      space = true; 
      break;
    }
    break;
  case PAUSE:
    break;
  case GAMEOVER:
    break;
  }
}

void keyReleased() {
  switch(mode) {
  case INTRO:
    break;
  case GAME:
    switch(key) {
    case 'w':
      w = false;
      break; 
    case 'a':
      a = false; 
      break;
    case 's':
      s = false; 
      break;
    case 'd':
      d = false; 
      break;
    case ' ':
      space = false;
      break;
    case '1':
      selected = oakPlanks;
      break;
    case '2':
      selected = mossyStone; 
      break;
    case '3':
      selected = emerald;
      break;
    case '4':
      selected = dirt;
      break;
    case '5':
      selected = log;
      break;
    }
    break;
  case PAUSE:
    break;
  case GAMEOVER:
    break;
  }
}
void mouseReleased() {
  if (mode == INTRO) {
    noCursor(); 
    mode = GAME;
  } else if (mode == GAMEOVER) {
    mode = INTRO; 
    p = new Player(g, width/2, 9*height/10, height/2, width/2, height/2, height/2-100, 0, 1, 0);
    bulletList = new ArrayList<GameObject>(); 
    cubes = new HashMap<String, Cube>();
    drawMap(); 
    drawFloor(-2000, 2000, height, gridSize); 

    w = false; 
    a = false;
    s = false; 
    d = false; 
    space = false;
  }
}
void mousePressed() {
  switch(mode) {
  case INTRO:

    break;
  case GAME:
    if (mouseButton == RIGHT) {
      //int row = ((int)(p.focusx))/100*100;
      //int col = ((int)(p.focusy))/100*100;
      //int depth = ((int)(p.focusz))/100*100;

      //float vx = cos(p.leftRightAngle); 
      //float vy = tan(p.upDownAngle); 
      //float vz = sin(p.leftRightAngle); 

      //float tr = (float)row-vx;
      //float tc = (float)col-vy;
      //float td = (float)depth-vz;

      //float ar = (float)row;
      //float ac = (float)col;
      //float ad = (float)depth;

      //while ((int)tr!=row && (int)tc!=col && (int)td!=depth) {
      //  tr = ((int)(tr-vx)/100)*100; 
      //  tc = ((int)(tc-vy)/100)*100; 
      //  td = ((int)(td-vz)/100)*100; 
      //  String th = (int)tr +" "+ (int)tc +" "+ (int)td;
      //  System.out.println(th); 
      //  if (cubes.containsKey(th)) {
      //    ar = ((int)(tr-vx)/100)*100; 
      //    ac = ((int)(tc-vy)/100)*100; 
      //    ad = ((int)(td-vz)/100)*100;
      //  }
      //}

      //row = (int)ar; 
      //col = (int)ac; 
      //depth = (int)ad;
      //String h = row +" "+ col +" "+ depth;

      //cubes.put(h, new Cube(g, (float)row, (float)col, (float)depth, selected));
      int row = ((int)(p.focusx))/100*100;
      int col = ((int)(p.focusy))/100*100;
      int depth = ((int)(p.focusz))/100*100;
      String  h = row +" "+ col +" "+ depth;
      cubes.put(h, new Cube(g, (float)row, (float)col, (float)depth, selected));
    } else if (mouseButton == LEFT) {
      int row = ((int)(p.focusx))/100*100;
      int col = ((int)(p.focusy))/100*100;
      int depth = ((int)(p.focusz))/100*100;
      String  h = row +" "+ col +" "+ depth;
      if (cubes.containsKey(h)) {
        cubes.remove(h);
      }
    }
    break;
  case GAMEOVER: 

    break;
  }
}
