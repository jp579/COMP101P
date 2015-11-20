/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Interactor for the Aliens and the Player
 * Checks if the player touches an alien 
 * (true => game over)
 */
 
class AlienSpaceshipInteractor extends Interactor<Alien, Spaceship> {
  World world;

  AlienSpaceshipInteractor(World world) {
    super();
    this.world = world;
    //Add your constructor info here
  }

  boolean detect(Alien a, Spaceship s) {
    //Add your detect method here
    return a.getShape().collide(s.getShape());
  }
  
  void handle(Alien a, Spaceship s) {
    ((MyWorld)world).endGame();
  }
}

