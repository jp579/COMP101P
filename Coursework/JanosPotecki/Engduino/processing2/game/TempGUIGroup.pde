/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk 
 *
 * Creates all the temperature gui on the right side
 *
 */
 
class TempGUIGroup extends Group<TempGui> {

  TempGUIGroup(World w) {
    super(w);
  }

  public void update() {
  }

  public void createTempGUI() {
    int i = 0;
    for (color c : TempColors.getColors ()) {
      TempGui t = new TempGui(i);
      _world.register(t);
      add(t);
      i++;
    }
  }
}

