/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Bullet being fired by the spaceship
 */
 
class Bullet extends Being {
  private static final int WIDTH  =  5;
  private static final int HEIGHT = 10;
  private final int ID;
  private PVector v = new PVector(0, -200); 

  Bullet(Spaceship s, int ID) {
    super(new HRectangle(s.getX() + Polygons.SPACESHIP_MIDDLE, s.getY()+Polygons.SPACESHIP_HEIGHT, WIDTH, HEIGHT));
    this.setVelocity(v);
    this.ID = ID;
  }

  public void draw() {
    fill(#000000);
    noStroke();
    _shape.draw();
  }
}

