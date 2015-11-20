/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Synchronizes the Aliens & their movements
 * checks also whether any aliens exist (if false => player wins)
 * and whether the aliens have reached the bottom ( true => player lose)
 * provides func to delete all aliens and to add aliens
 */
 
class AlienGroup extends Group<Alien> {
  private static final int DOWN = 20;
  private static final int RIGHT= 20;
  private static final int LEFT = -1 * RIGHT;
  private static final int SPEED= 1200; // time after which aliens move
  public boolean playingGame = true;
  private long lastTime;

  /* saves last move: 
   * [D]own
   * [L]eft 
   * [R]ight 
   * [X}Down
   * Direction is Right, Down, Left, (X)Down, Right, Down, ...
   * Start with X, hence first move is to the right side.
   */
  private char lastMove = 'X'; 
  private int ALIEN_ID = 0;

  AlienGroup(World w) {
    super(w);
    lastTime = millis();
  }

  public void update() {
    if (size() == 0 && playingGame) {
      ((MyWorld)_world).winGame();
    }
    for (Alien a : getObjects ()) {
      if(a.getY() > WINDOW_HEIGHT)
         ((MyWorld)_world).endGame();
    }

    if (millis() - lastTime >= SPEED - TempColors.SPEED_INCREASER) {
      lastTime = millis();
      int x = 0;
      int y = 0;

      if (lastMove == 'R') {
        y += DOWN;
        lastMove = 'D';
      } else if (lastMove == 'D') {
        x += LEFT;
        lastMove = 'L';
      } else if (lastMove == 'L') {
        y += DOWN;
        lastMove = 'X';
      } else if (lastMove == 'X') {
        x += RIGHT;
        lastMove = 'R';
      }
      for (Alien a : getObjects ()) {
        a.setPosition(a.getX() + x, a.getY() + y);
      }
    }
  }

  public void deleteAll() {
    for (Alien a : getObjects ()) {
      _world.delete(a);
    }
    redraw();
  }

  public void addAlien() {
    int ROW = ALIEN_ID / 11;
    Alien a = new Alien(ALIEN_ID, ROW);
    _world.register(a);
    add(a);
    ALIEN_ID++;
  }
}

