  /*
   * Written by Janos Potecki during reading week UCL Term 1 15/16
   * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk
   *
   * Array holding all BackgroundColors
   * Lightsensor Engduino 2.1 Range: "The values returned range from 0 to 1023, inclusive"
   * http://www.engduino.org/fileadmin/engduino/doc/Engduinov2.1_LightSensor.pdf
   * Assumtion: same for Engduino 3
   * 
   */
static class BackgroundColors {

  private static color[] colors = {
    #3D3D3D, #4D4D4D, #5C5C5C, #696969, #787878, 
    #828282, #919191, #A1A1A1, #ABABAB, #B8B8B8, #C2C2C2
  };
  private static int light = 500;

  public static void setLight(int in) {
    if (in >= 1100)
      light = 1100;
    else if (in <= 0)
      light = 0;
    else  
      light = in;
  }

  public static color getBackground() {
    return colors[int(light / 100)];
  }
}

