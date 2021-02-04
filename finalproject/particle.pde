class Particle extends GameObject {
  PVector dir; 
  float speed;

  public Particle(PGraphics g, PVector l) {
    super(g, l.x, l.y, l.z); 
    speed = random(30, 70); 
    float vx = random(-360, 360); 
    float vy = random(-360, 360); 
    float vz = random(-360, 360); 
    this.dir = new PVector(radians(vx), radians(vy), radians(vz)); 
    this.dir.setMag(speed);
    lives = 5; 
  }

  public void show() {
    g.pushMatrix(); 
    g.translate(loc.x, loc.y, loc.z); 
    g.fill(#2a9d8f); 
    g.stroke(100); 
    g.box(10); 
    g.popMatrix();
  }

  public void act() {
    lives--;
    loc.add(dir); 
  }
}
