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
    g.fill(#264653); 
    g.stroke(100); 
    g.box(10); 
    g.popMatrix();
  }

  public void act() {
    if(loc.x>=1900 || loc.x<=-1900 || loc.z>=1900 || loc.z<=-1900 || loc.y>=1900 || loc.y<=-1900) {
      lives = 0; 
      for (int i = 0; i<5; i++) {
        bulletList.add(new Particle(g, loc));
      }
    } else {
      loc.add(dir); 
    }
  }
}
