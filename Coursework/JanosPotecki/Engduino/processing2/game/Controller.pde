/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Controller for the game as a hub for objects and the
 * world to interact with each other
 *
 */
 
class Controller {
  Spaceship spaceship;
  World world;
  BulletGroup b;

  public void linkWorld(World w) {
    this.world = w;
  }

  public void linkSpaceship(Spaceship s) {
    this.spaceship = s;
  }

  public void moveSpaceship(char c) {
    spaceship.move(c);
  }
  public void linkBulletGroup(BulletGroup b) {
    this.b = b;
  }
  public void shotBullet() {
    b.addBullet();
  }
}

