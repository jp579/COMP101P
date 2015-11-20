/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Only File needed to be changed by the Player before 
 * starting the game
 *
 */
 
import processing.serial.*;

class SETUP {
  /* ************************************************ 
   *
   * JUST EDIT THE VARIABLES HERE
   * possible output of Serial.list()[port]:
   * [0] "/dev/cu.Bluetooth-Incoming-Port"
   * [1] "/dev/cu.usbmodem14131"
   * [2] "/dev/tty.Bluetooth-Incoming-Port"
   * [3] "/dev/tty.usbmodem14131"   
   * 
   * set port to the correct number => in this case 3
   ************************************************ */

  private int port = 3;



  /*************************************************** 
   * END OF SETUP
   * 
   * DON'T CHANGE ANYTHING HERE
   *
   ************************************************ */
  public Serial PORT;

  SETUP(PApplet parent) {
    this.PORT = new Serial(parent, Serial.list()[port], 9600);
  }
}

