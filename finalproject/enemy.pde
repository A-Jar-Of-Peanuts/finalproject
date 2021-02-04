class Enemy extends GameObject {
  PVector dir; 
  float speed; 
  public Enemy(PGraphics g) {
    super(g, random(-2000, 2000), height-50, random(-2000, 2000)); 
    float x = Math.abs(p.loc.x-loc.x); 
    float z = Math.abs(p.loc.z-loc.z); 
    dir = new PVector(x, 0, z);
    speed = 5;
    dir.setMag(speed);
  }

  public void act() {
    for (int i = 0; i<bulletList.size(); i++) {
      if (bulletList.get(i) instanceof Bullet) {
        PVector temp = bulletList.get(i).loc;
        if (Math.abs(temp.x-loc.x)<=60 && Math.abs(temp.y-loc.y)<=60 && Math.abs(temp.z-loc.z)<=60) {
          this.lives = 0; 
          bulletList.get(i).lives = 0; 
        }
      }
    }
    float x = p.loc.x-loc.x; 
    float z = p.loc.z-loc.z; 
    dir = new PVector(x, 0, z);
    dir.setMag(speed);
    if (Math.abs(p.loc.x-loc.x)<=100 && Math.abs(p.loc.y-loc.y)<=100 && Math.abs(p.loc.z-loc.z)<=100) {
      this.lives = 0; 
      p.lives--;
    }
    loc.add(dir);
  }

  public void show() {
    g.pushMatrix(); 
    g.fill(#e5989b); 
    g.noStroke(); 
    g.translate(loc.x, loc.y, loc.z); 
    g.sphere(50); 
    g.popMatrix();
  }
}
