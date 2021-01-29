class Bullet extends GameObject {
  PVector dir;
  float speed; 

  public Bullet(PGraphics g) {
    super(g, p.loc.x, p.loc.y, p.loc.z); 
    speed = 50; 
    float vx = cos(p.leftRightAngle); 
    float vy = tan(p.upDownAngle); 
    float vz = sin(p.leftRightAngle); 
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }

  public void show() {
    g.pushMatrix(); 
    g.translate(loc.x, loc.y, loc.z); 
    g.fill(white); 
    g.stroke(100); 
    g.box(10); 
    g.popMatrix();
  }

  public void act() {
    int hitx = int(loc.x+2000)/gridSize; 
    int hity = int(loc.z+2000)/gridSize; 
    if (map.get(hitx, hity) == white) {
      loc.add(dir);
    } else {
      lives = 0; 
      for (int i = 0; i<5; i++) {
        bulletList.add(new Particle(g, loc));
      }
    }
  }
}
