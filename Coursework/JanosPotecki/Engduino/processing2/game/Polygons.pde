  /*
   * Written by Janos Potecki during reading week UCL Term 1 15/16
   * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
   *
   * Place for all the polygons like the spaceship and the aliens
   * THAT'S THE JOB FOR DESIGNERS, NOT PROGRAMMERS!!!!!1111
   * volunteers needed :D
   */
   
static class Polygons {

  static final int SPACESHIP_HEIGHT = -100;
  static final int SPACESHIP_MIDDLE = 50;
  static final ArrayList<PVector> SPACESHIP = new ArrayList<PVector>() {
    {
      add(new PVector(  0, 0));
      add(new PVector(  5, -10));
      add(new PVector( 25, -25));
      add(new PVector( 35, -50)); 
      add(new PVector( 50, -70)); // middle 
      add(new PVector( 65, -50));
      add(new PVector( 75, -25));
      add(new PVector( 95, -10));
      add(new PVector(100, 0));
      add(new PVector( 90, -5));
      add(new PVector( 50, -9)); // middle
      add(new PVector( 10, -5));
    }
  };

  static final int ALIEN_WIDTH = 50;
  static final int ALIEN_HEIGHT= 20;
  static final ArrayList<PVector> ALIEN = new ArrayList<PVector>() {
    {
      add(new PVector(  0, 0));
      add(new PVector(-10, -10));
      add(new PVector( -5, -10));
      add(new PVector(  0, -20));
      add(new PVector( 30, -20));
      add(new PVector( 35, -10));
      add(new PVector( 40, -10));
      add(new PVector( 30, 0));
      add(new PVector(  0, 0)); 
      add(new PVector( 40, -40));
    }
  };
}

