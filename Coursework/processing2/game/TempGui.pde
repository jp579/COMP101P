/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk 
 *
 * GUI for one temperature
 */
 
class TempGui extends Being {
  private int ID;

  TempGui(int ID) {
    super(
    new HRectangle(WINDOW_WIDTH-100, 
    ID*(WINDOW_HEIGHT / 31 + 0.5f), 
    100, 
    ID*(WINDOW_HEIGHT / 31+ 0.5f) + (WINDOW_HEIGHT / 31+ 0.5f
      )));
    this.ID = ID;
  }

  public void update() {
  }

  public void draw() {
    fill(TempColors.getColors()[this.ID]);
    noStroke();
    _shape.draw();
  }
}

