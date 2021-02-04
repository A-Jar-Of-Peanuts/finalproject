class Bullet extends GameObject {
  PVector dir;
  float speed; 

  public Bullet(PGraphics g) {
    super(g, p.loc.x, p.loc.y, p.loc.z); 
    speed = 50; 
    float vx = cos(p.leftRightAngle); 
    float vy = tan(p.upDownAngle); 
    float vz = sin(p.leftRightAngle); 
    this.dir = new PVector(vx, vy, vz);
    this.dir.setMag(speed);
  }

  public void show() {
    g.pushMatrix(); 
    g.translate(loc.x, loc.y, loc.z); 
    g.fill(0, 255, 0); 
    g.stroke(100); 
    g.box(10); 
    g.popMatrix();
  }

  public void act() {
    //if (map.get(hitx, hity) == white) {
    //  loc.add(dir);
    //} else {
    //  lives = 0; 
    //  for (int i = 0; i<5; i++) {
    //    bulletList.add(new Particle(g, loc));
    //  }
    //}
    if(loc.x>=2000 || loc.x<=-2000 || loc.z>=2000 || loc.z<=-2000 || loc.y>=2000 || loc.y<=-2000) {
      lives = 0; 
      for (int i = 0; i<5; i++) {
        bulletList.add(new Particle(g, loc));
      }
    } else {
      loc.add(dir); 
    }
  }
}
