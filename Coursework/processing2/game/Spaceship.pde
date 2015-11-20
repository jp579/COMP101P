/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * The Spaceship for the player
 * 
 *
 */
 
class Spaceship extends Being {
  private final color myColor = #050505;
  static final int WIDTH = 40;
  static final int HEIGHT = 70;
  static final float MOVE = 25.0f;

  Spaceship() {
    super( 
    new HPolygon( 
    new PVector(WINDOW_WIDTH / 2 - (WIDTH / 2), WINDOW_HEIGHT), 
    Polygons.SPACESHIP
      )
      );
  }

  public void update() {
  }

  public void draw() {
    fill(myColor);
    noStroke();
    _shape.draw();
  } 

  public void move(char c) {
    if (c == 'L') {
      _position.x -= this.MOVE;
      if (_position.x < 0) {
        _position.x = 0;
      }
    } else if (c == 'R') {
      _position.x += this.MOVE;
      if (_position.x + Polygons.SPACESHIP_MIDDLE * 2 > WINDOW_WIDTH - 100) {
        _position.x = WINDOW_WIDTH - Polygons.SPACESHIP_MIDDLE * 2 - 100;
      }
    }
  }
}

