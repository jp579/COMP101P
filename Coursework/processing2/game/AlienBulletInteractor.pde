/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Interactor for the Bullets and the Aliens
 * In case of bullet/alien collision deletes both
 */
 
class AlienBulletInteractor extends Interactor<Alien, Bullet> {
  
  World world;

  AlienBulletInteractor(World world) {
    super();
    this.world = world;
  }
  
  boolean detect(Alien a, Bullet b) {
    return a.getShape().collide(b.getShape());
  }
  
  void handle(Alien a, Bullet b) {
    world.delete(a);
    world.delete(b);
  }
}

