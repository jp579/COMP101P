/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Synchronizes the Bullets (with "cooldown")
 */
 
class BulletGroup extends Group<Bullet> {
  private Spaceship s;
  private int ID = 0;
  private long lastShot = 0;
 
 /*
  *
  * COOLDOWN is the time (in msec) which has to pass
  * before player can shot again
  * set to 0 to enable maschinegun like fire
  */
  private int COOLDOWN = 500;

  BulletGroup(World w, Spaceship s) {
    super(w);
    this.s = s;
  }

  public void update() {
  }

  public void addBullet() {
    if (lastShot == 0 || millis() - lastShot >= COOLDOWN) {
      lastShot = millis();
      Bullet b = new Bullet(s, ID);
      _world.register(b);
      add(b);
      ID++;
    }
  }
}

