/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * The WORLD
 * That's where all happens :)
 */
 
class MyWorld extends World {
  
  
  private final color spaceshipColor = #000000;
  private final Spaceship spaceship;
  private final Controller controller;
  private AlienGroup aliens;
  public boolean isGameOver = false;
  private boolean wonGame = false;

  MyWorld(int portIn, int portOut, Controller controller) {
    super(portIn, portOut);
    this.spaceship = new Spaceship();
    this.controller = controller;
  }
  void setup() {    
    register(spaceship);
    controller.linkSpaceship(spaceship);
    BulletGroup bulletgroup = new BulletGroup(this, spaceship);
    controller.linkBulletGroup(bulletgroup);
    aliens = new AlienGroup(this);
    register(aliens);
    TempGUIGroup tempGUI = new TempGUIGroup(this);
    tempGUI.createTempGUI();

    for (int i = 0; i < 33; i++) {
      aliens.addAlien();
    } 
    register(aliens, bulletgroup, new AlienBulletInteractor(this));
    register(aliens, spaceship, new AlienSpaceshipInteractor(this));
  }

  void draw() {
    background(BackgroundColors.getBackground());

    if (isGameOver) {  
      if (wonGame) {
        textSize(32);
        text("YOU WON!!!", 220, WINDOW_HEIGHT/2);
        fill(TempColors.getColor());
      } else {
        textSize(32);
        text("GAME OVER!", 220, WINDOW_HEIGHT/2);
        fill(TempColors.getColor());
      }
    } 
    super.draw();
    if (!isGameOver)
      drawTemperatures();
  }

  public void winGame() {
    endGame();
    wonGame = true;
  }

  public void endGame() {
    isGameOver = true;
    aliens.playingGame = false;
    aliens.deleteAll();
    this.delete(spaceship);
    wonGame = false;
  }

  public Controller getController() {
    return controller;
  }

  public void drawTemperatures() {
    textSize(12);
    int currentTemp = (int)(TempColors.getTemperature()+ 0.5f);
    for (int i = 0; i < 32; i++) {
      if (i != currentTemp) {
        text(i + "ºC", 645, i * (WINDOW_HEIGHT / 31 + 0.5f) + (WINDOW_HEIGHT / 31 + 0.5f) -7 );
      } else {
        text("Current:" + TempColors.getTemperature() + "ºC", 602, 
        (int)(TempColors.getTemperature()+ 0.5f) * (WINDOW_HEIGHT / 31+ 0.5f) + (WINDOW_HEIGHT / 31 + 0.5f) - 7);
      }
    }  
    fill(this.spaceshipColor);
  }
}

