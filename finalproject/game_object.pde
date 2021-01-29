class GameObject {
  PVector loc;
  PGraphics g; 
  int lives;
  
  public GameObject(PGraphics g, float x, float y, float z) {
    this.g = g; 
    loc = new PVector(x, y, z); 
    lives = 1; 
  }
  
  public void show() {
  }
  
  public void act() {
  }
}
