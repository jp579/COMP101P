/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * A simple clone of the arcade game space invaders,
 * which uses the engduino as a controller
 * for the ship to move and shoot.
 * Furthermore, the backgoundcolor is set by using
 * the light sensor of the arduino and the color 
 * of the "invaders" changes with the temperature 
 * measured by the engduino
 *
 * For the game the Hermes lib for processing 2 is
 * used.
 * The template and doc can be found at
 * https://github.com/rdlester/hermes/wiki/Tutorial-Pt.-1:-Worlds-and-Beings
 * JAVADOC
 * http://rdlester.github.io/hermes/doc/
 */
 
import processing.serial.*;
import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.physics.*;
import hermes.postoffice.*;


/*
 * Constants
 */
static final int WINDOW_WIDTH = 700;
static final int WINDOW_HEIGHT = 600;
static final int PORT_IN = 8080;
static final int PORT_OUT = 8000; 

MyWorld world;
Data reader;
Controller controller;


void setup() {
  
  SETUP setup = new SETUP(this);
  reader = new Data(setup);
  controller = new Controller();
  
  size(WINDOW_WIDTH, WINDOW_HEIGHT); 
  Hermes.setPApplet(this);
  
  world = new MyWorld(PORT_IN, PORT_OUT, controller);   
  
  controller.linkWorld(world);  
  reader.setController(controller);
  
  world.start();

}

void draw() {
  
  reader.readData();
  world.draw();
}
