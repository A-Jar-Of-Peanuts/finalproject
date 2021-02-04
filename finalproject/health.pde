class HealthPotion extends GameObject {

  public HealthPotion(PGraphics g) {
    super(g, random(-2000, 2000), height-10, random(-2000, 2000));
  }

  public void act() {
    if (Math.abs(p.loc.x-loc.x)<=60 && Math.abs(p.loc.z-loc.z)<=60) {
      this.lives = 0; 
      p.lives++;
    }
  }

  public void show() {
    g.pushMatrix();
    g.fill(255, 0, 0); 
    g.translate(this.loc.x, this.loc.y, this.loc.z); 
    g.sphere(10); 
    g.popMatrix();
  }
}
