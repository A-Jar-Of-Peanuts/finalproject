class Snowflake extends GameObject {

  float size, speed;

  Snowflake(PGraphics g) {
    super(g, random(-2000, 2000), random(-2000, 2000), random(-2000, 2000));
    size = random(3, 10);
    speed = size;
  }

  void act() {
    loc.y = loc.y + speed;
    if (loc.y > height) {
      loc.y = -2000;
      loc.x = random(-2000, 2000);
      loc.z = random(-2000, 2000);
    }
  }

  void show() {
    g.beginDraw(); 
    g.fill(255); 
    g.pushMatrix();
    g.translate(loc.x, loc.y, loc.z); 
    g.box(size, size, size); 
    g.popMatrix();
  }
}
