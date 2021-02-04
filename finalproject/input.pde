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
    }
    break;
  case PAUSE:
    break;
  case GAMEOVER:
    break;
  }
}

void mousePressed() {
  switch(mode) {
  case INTRO:
    noCursor(); 
    mode = GAME; 
    break;
  case GAME:
    if (mouseButton == RIGHT) {
      //println("pressed"); 
      int row = ((int)(p.focusx))/100*100;
      int col = ((int)(p.focusy))/100*100;
      int depth = ((int)(p.focusz))/100*100;
      String  h = row +" "+ col +" "+ depth;
      cubes.put(h, new Cube(g, (float)row, (float)col, (float)depth, selected));
      break;
    } else if(mouseButton == LEFT) {
      int row = ((int)(p.focusx))/100*100;
      int col = ((int)(p.focusy))/100*100;
      int depth = ((int)(p.focusz))/100*100;
      String  h = row +" "+ col +" "+ depth;
      if(cubes.containsKey(h)) {
        cubes.remove(h); 
      }
    }
  }
}
