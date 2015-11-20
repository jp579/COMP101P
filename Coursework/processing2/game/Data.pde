/*
 * Written by Janos Potecki 
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
 *
 * Datascrapper to read the information provided by the
 * Engduino or any other controller via Serial.Port
 * Serial.Port output must be:
 * eg: "0:C_1:22.00_2:17_3:F"
 * 
 * 0 move 
 * 1 temperature
 * 2 light
 * 3 triggered buttom
 * 
 * hence "0:C_1:22.00_2:17_3:F" means:
 * 0: C(enter)
 * 1: 22.00 (degree)
 * 2: 17
 * 3: F(alse)
 */
 
import processing.serial.*;

class Data {
  private Controller controller;
  private Serial myPort;
  private long lastTime = 0; 
  private long UPDATE_LIGHT = 1000; // to restrict the update of the light
                                    // time measured in msec

  public Data(SETUP setup) {
    myPort = setup.PORT;
  }

  public void setController(Controller controller) {
    this.controller = controller;
  }

  private void slice(String inBuffer) {
    /* check if input is has the correct starting format
     * => first 2 chars are "0:"
     * eg: string = 0:C_1:22.00_2:17_3:F 
     */
     
    if (inBuffer.charAt(0) == '0' && inBuffer.charAt(1) == ':') {
      int moveEnd = inBuffer.indexOf("_");
      controller.moveSpaceship(inBuffer.charAt(2));
      inBuffer = inBuffer.substring(moveEnd+1, inBuffer.length());

      // set the temperature
      int tempBeg = inBuffer.indexOf("1:");
      int tempEnd = inBuffer.indexOf("_");
      float f = float(inBuffer.substring(tempBeg+2, tempEnd));
      TempColors.setTemperature(f);
      inBuffer = inBuffer.substring(tempEnd+1, inBuffer.length());

      // the light
      int lightBeg = inBuffer.indexOf("2:");
      int lightEnd = inBuffer.indexOf("_");
      int light = int(inBuffer.substring(lightBeg+2, lightEnd));

      if (lastTime == 0 || millis() - lastTime > UPDATE_LIGHT) {
        BackgroundColors.setLight(light);
        lastTime = millis();
      }
      inBuffer = inBuffer.substring(lightEnd+1, inBuffer.length());

      // shot fired?
      int fireBeg = inBuffer.indexOf("3:");
      if (inBuffer.charAt(fireBeg+2) == 'T')
        controller.shotBullet();
    }
  }

  public void readData() {
    while (myPort.available () > 0) {
      String inBuffer = myPort.readString();   
      if (inBuffer != null) {
        slice(inBuffer);
      }
    }
  }
}

