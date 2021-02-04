class Player extends GameObject {
  float focusx, focusy, focusz, upx, upy, upz;
  float leftRightAngle, upDownAngle; 
  float pmx, pmy, mx, my; 

  public Player(PGraphics g, float x, float y, float z, float focusx, float focusy, float focusz, float upx, float upy, float upz) {
    super(g, x, y, z); 
    this.focusx = focusx;
    this.focusy = focusy;
    this.focusz = focusz;
    this.upx = upx;
    this.upy = upy;
    this.upz = upz;
    lives = 3; 

    try {
      r = new Robot();
    } 
    catch(Exception e) {
      println("hi");
    }
  }

  public void show() {
    //System.out.println("hello"); 
    g.camera(loc.x, loc.y, loc.z, focusx, focusy, focusz, upx, upy, upz);
  }

  public void act() {
    //if (a && canMoveForward() && canMoveLeft() && canMoveRight() && canMoveBack()) {
    //  loc.x -= cos(leftRightAngle+PI/2)*10;
    //  loc.z -= sin(leftRightAngle+PI/2)*10;
    //}
    //if (d && canMoveForward() && canMoveLeft() && canMoveRight() && canMoveBack()) {
    //  loc.x += cos(leftRightAngle+PI/2)*10;
    //  loc.z += sin(leftRightAngle+PI/2)*10;
    //}
    //if (w && canMoveForward() && canMoveLeft() && canMoveRight() && canMoveBack()) {
    //  loc.z += sin(leftRightAngle)*10;
    //  loc.x += cos(leftRightAngle)*10;
    //}
    //if (s && canMoveForward() && canMoveLeft() && canMoveRight() && canMoveBack()) {
    //  loc.z -= sin(leftRightAngle)*10;
    //  loc.x -= cos(leftRightAngle)*10;
    //}




    //System.out.println("hello"); 
    if (a) {
      int row = ((int)(loc.x - cos(leftRightAngle+PI/2)*100))/100*100;
      int col = ((int)(loc.y))/100*100;
      int depth = ((int)(loc.z - sin(leftRightAngle+PI/2)*100))/100*100;
      String  h = row +" "+ col +" "+ depth;

      if (!cubes.containsKey(h)) {
        loc.x -= cos(leftRightAngle+PI/2)*10;
        loc.z -= sin(leftRightAngle+PI/2)*10;
      }
    }
    if (d) {
      int row = ((int)(loc.x + cos(leftRightAngle+PI/2)*100))/100*100;
      int col = ((int)(loc.y))/100*100;
      int depth = ((int)(loc.z + sin(leftRightAngle+PI/2)*100))/100*100;
      String  h = row +" "+ col +" "+ depth;

      if (!cubes.containsKey(h)) {
        loc.x += cos(leftRightAngle+PI/2)*10;
        loc.z += sin(leftRightAngle+PI/2)*10;
      }
    }
    if (w) {
      int row = ((int)(loc.x + cos(leftRightAngle)*100))/100*100;
      int col = ((int)(loc.y))/100*100;
      int depth = ((int)(loc.z + sin(leftRightAngle)*100))/100*100;
      String  h = row +" "+ col +" "+ depth;

      if (!cubes.containsKey(h)) {
        loc.z += sin(leftRightAngle)*10;
        loc.x += cos(leftRightAngle)*10;
      }
    }
    if (s) {
      int row = ((int)(loc.x - cos(leftRightAngle)*100))/100*100;
      int col = ((int)(loc.y))/100*100;
      int depth = ((int)(loc.z - sin(leftRightAngle)*100))/100*100;
      String  h = row +" "+ col +" "+ depth;

      if (!cubes.containsKey(h)) {
        loc.z -= sin(leftRightAngle)*10;
        loc.x -= cos(leftRightAngle)*10;
      }
    }



    focusx = loc.x + cos(leftRightAngle)*300; 
    focusy = loc.y + tan(upDownAngle)*300; 
    focusz = loc.z + sin(leftRightAngle)*300;

    if (mx>pmx) {
      leftRightAngle = leftRightAngle + 0.1;
    } else if (pmx>mx) {
      leftRightAngle = leftRightAngle - 0.1;
    }

    if (mouseY>pmouseY) {
      upDownAngle = upDownAngle + 0.1;
    } else if (pmouseY>mouseY) {
      upDownAngle = upDownAngle - 0.1;
    }

    if (upDownAngle > radians(89)) {
      upDownAngle = radians(89);
    } else if (upDownAngle < -radians(89)) {
      upDownAngle = -radians(89);
    }

    //if (frameCount%10 == 0) {
    //  r.mouseMove(width/2, height/2);
    //  mouseX = width/2;
    //  mouseY = height/2;
    //}

    //if (frameCount % 10 == 0) r.mouseMove(width/2, height/2);
    pmx = pmouseX;   
    mx = mouseX;   

    if (mouseX >= width-10 && frameCount%3 == 0) {
      mx+=.5;
    } else if (mouseX <= 10 && frameCount%3 == 0) {
      mx-=.5;
    }
  }

  boolean canMoveForward() {
    float fwdx, fwdy, fwdz;
    float leftx, lefty, leftz;
    float rightx, righty, rightz;
    int mapx, mapy; 
    int leftmapx, leftmapy;
    int rightmapx, rightmapy;
    fwdx = loc.x + cos(leftRightAngle)*200; 
    fwdy = loc.y;
    fwdz = loc.z + sin(leftRightAngle)*200;

    leftx = loc.x + cos(leftRightAngle+radians(20))*200; 
    lefty = loc.y;
    leftz = loc.z + sin(leftRightAngle+radians(20))*200;

    rightx = loc.x + cos(leftRightAngle-radians(20))*200; 
    righty = loc.y;
    rightz = loc.z + sin(leftRightAngle-radians(20))*200;

    mapx = (int)(fwdx+2000)/gridSize;
    mapy = (int)(fwdz+2000)/gridSize;

    leftmapx = (int)(leftx+2000)/gridSize;
    leftmapy = (int)(leftz+2000)/gridSize;

    rightmapx = (int)(rightx+2000)/gridSize;
    rightmapy = (int)(rightz+2000)/gridSize;

    return map.get(mapx, mapy) == white && map.get(leftmapx, leftmapy) == white && map.get(rightmapx, rightmapy) == white;
  }
  boolean canMoveLeft() {
    float fwdx, fwdy, fwdz;
    float leftx, lefty, leftz;
    float rightx, righty, rightz;
    int mapx, mapy; 
    int leftmapx, leftmapy;
    int rightmapx, rightmapy;
    fwdx = loc.x + cos(leftRightAngle+radians(90))*200; 
    fwdy = loc.y;
    fwdz = loc.z + sin(leftRightAngle+radians(90))*200;

    leftx = loc.x + cos(leftRightAngle+radians(20)+radians(90))*200; 
    lefty = loc.y;
    leftz = loc.z + sin(leftRightAngle+radians(20)+radians(90))*200;

    rightx = loc.x + cos(leftRightAngle-radians(20)+radians(90))*200; 
    righty = loc.y;
    rightz = loc.z + sin(leftRightAngle-radians(20)+radians(90))*200;

    mapx = (int)(fwdx+2000)/gridSize;
    mapy = (int)(fwdz+2000)/gridSize;

    leftmapx = (int)(leftx+2000)/gridSize;
    leftmapy = (int)(leftz+2000)/gridSize;

    rightmapx = (int)(rightx+2000)/gridSize;
    rightmapy = (int)(rightz+2000)/gridSize;

    return map.get(mapx, mapy) == white && map.get(leftmapx, leftmapy) == white && map.get(rightmapx, rightmapy) == white;
  }
  boolean canMoveRight() {
    float fwdx, fwdy, fwdz;
    float leftx, lefty, leftz;
    float rightx, righty, rightz;
    int mapx, mapy; 
    int leftmapx, leftmapy;
    int rightmapx, rightmapy;
    fwdx = loc.x + cos(leftRightAngle-radians(90))*200; 
    fwdy = loc.y;
    fwdz = loc.z + sin(leftRightAngle-radians(90))*200;

    leftx = loc.x + cos(leftRightAngle+radians(20)-radians(90))*200; 
    lefty = loc.y;
    leftz = loc.z + sin(leftRightAngle+radians(20)-radians(90))*200;

    rightx = loc.x + cos(leftRightAngle-radians(20-radians(90)))*200; 
    righty = loc.y;
    rightz = loc.z + sin(leftRightAngle-radians(20)-radians(90))*200;

    mapx = (int)(fwdx+2000)/gridSize;
    mapy = (int)(fwdz+2000)/gridSize;

    leftmapx = (int)(leftx+2000)/gridSize;
    leftmapy = (int)(leftz+2000)/gridSize;

    rightmapx = (int)(rightx+2000)/gridSize;
    rightmapy = (int)(rightz+2000)/gridSize;

    return map.get(mapx, mapy) == white && map.get(leftmapx, leftmapy) == white && map.get(rightmapx, rightmapy) == white;
  }

  boolean canMoveBack() {
    float fwdx, fwdy, fwdz;
    float leftx, lefty, leftz;
    float rightx, righty, rightz;
    int mapx, mapy; 
    int leftmapx, leftmapy;
    int rightmapx, rightmapy;
    fwdx = loc.x + cos(leftRightAngle-radians(180))*200; 
    fwdy = loc.y;
    fwdz = loc.z + sin(leftRightAngle-radians(180))*200;

    leftx = loc.x + cos(leftRightAngle+radians(20)-radians(180))*200; 
    lefty = loc.y;
    leftz = loc.z + sin(leftRightAngle+radians(20)-radians(180))*200;

    rightx = loc.x + cos(leftRightAngle-radians(20)-radians(180))*200; 
    righty = loc.y;
    rightz = loc.z + sin(leftRightAngle-radians(20)-radians(180))*200;

    mapx = (int)(fwdx+2000)/gridSize;
    mapy = (int)(fwdz+2000)/gridSize;

    leftmapx = (int)(leftx+2000)/gridSize;
    leftmapy = (int)(leftz+2000)/gridSize;

    rightmapx = (int)(rightx+2000)/gridSize;
    rightmapy = (int)(rightz+2000)/gridSize;

    return map.get(mapx, mapy) == white && map.get(leftmapx, leftmapy) == white && map.get(rightmapx, rightmapy) == white;
  }
}
