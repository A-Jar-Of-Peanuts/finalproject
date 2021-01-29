class Cube extends GameObject {
  PImage texture; 

  public Cube(PGraphics g, float x, float y, float z, PImage texture) {
    super(g, x, y, z); 
    this.texture = texture;
  }

  public void show() {
    g.pushMatrix(); 
    g.translate(loc.x, loc.y, loc.z); 
    g.scale(100);   

    g.noStroke();  

    g.beginShape(QUADS);
    g.texture(texture); 
    //top
    g.vertex(0, 0, 0, 0, 0); 
    g.vertex(1, 0, 0, 0, 1); 
    g.vertex(1, 0, 1, 1, 1); 
    g.vertex(0, 0, 1, 1, 0); 
    g.endShape();


    g.beginShape(QUADS);
    g.texture(texture); 

    //bottom
    g.vertex(0, 1, 0, 0, 0); 
    g.vertex(1, 1, 0, 0, 1); 
    g.vertex(1, 1, 1, 1, 1); 
    g.vertex(0, 1, 1, 1, 0); 
    g.endShape(); 

    g.beginShape(QUADS);
    g.texture(texture);

    //front
    g.vertex(0, 0, 1, 0, 0); 
    g.vertex(0, 1, 1, 0, 1); 
    g.vertex(1, 1, 1, 1, 1); 
    g.vertex(1, 0, 1, 1, 0); 
    g.endShape();

    g.beginShape(QUADS);
    g.texture(texture);

    //back
    g.vertex(0, 0, 0, 0, 0); 
    g.vertex(0, 1, 0, 0, 1); 
    g.vertex(1, 1, 0, 1, 1); 
    g.vertex(1, 0, 0, 1, 0);
    g.endShape();

    g.beginShape(QUADS);
    g.texture(texture);

    //left
    g.vertex(0, 0, 0, 0, 0); 
    g.vertex(0, 1, 0, 0, 1); 
    g.vertex(0, 1, 1, 1, 1); 
    g.vertex(0, 0, 1, 1, 0); 
    g.endShape();

    g.beginShape(QUADS);
    g.texture(texture);

    //right
    g.vertex(1, 0, 0, 0, 0); 
    g.vertex(1, 1, 0, 0, 1); 
    g.vertex(1, 1, 1, 1, 1); 
    g.vertex(1, 0, 1, 1, 0); 

    g.endShape();

    g.popMatrix();
  }
}
