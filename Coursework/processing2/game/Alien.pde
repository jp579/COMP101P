/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Alien
 */
 
class Alien extends Being {
  private final static int OFFSET = 14;
  private final static int Y_OFFSET = 30;
  private final int ID;

  Alien(int ID, int ROW) {
    super(
    new HPolygon(
    new PVector((ID % 11) * (Polygons.ALIEN_WIDTH + 2) + OFFSET, ROW * (Polygons.ALIEN_HEIGHT + 10) + Y_OFFSET), 
    Polygons.ALIEN)
      );
    this.ID = ID;
  }

  public void update() {     
  }

  public void draw() {
    fill(TempColors.getColor());
    noStroke();
    _shape.draw();
  }
}

