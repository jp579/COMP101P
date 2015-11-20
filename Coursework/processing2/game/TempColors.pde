/*
 * Written by Janos Potecki during reading week UCL Term 1 15/16
 * janos(dot)potecki(dot)15(et)ucl(dot)ac(dot)uk 
 *
 * array holding all colors
 * every temp has an own color 
 * temperatures < 0 are 0 and
 * temperatures > 30 are 30
 * you shouldn't play below 0C or above 30C
 * (: 
 */

static class TempColors {

  private static float temperature = 0;
  private static color c = #0000cc;
  public static int SPEED_INCREASER = 0;

  private static color[] colors = {
    // 0 - 10 blue
    #003cb3, #004ee6, #1a68ff, #4d8aff, #80acff, 
    #0086c9, #00a8fb, #2ebaff, #60caff, #00FFFF, 
    //11 - 20 green
    #00FFCC, #00cca4, #00b359, #00e673, #33CC33, 
    #00c900, #00fb00, #2eff2e, #97e300, #b1ff16, 
    //20 - 30 orange/red
    #999900, #cbcc00, #fdff00, #ffb74c, #fd9900, 
    #fe7f00, #ff6969, #ff6868, #ff4e4e, #e60000, #900000
  };

  public static void setTemperature(float t) {
    temperature = t;
    int temp = (int) (temperature + 0.5f); // add 0.5f and the floats are rounded correctly
    if (temp <= 0) {
      c = colors[0];
    } else if (temp >= 30) {
      c = colors[30];
    } else {
      c = colors[temp];
    }
    SPEED_INCREASER = (int) pow((temp % 10), 2.5 ) + (temp / 10) * 250;
  }

  public static float getTemperature() {
    return temperature;
  }

  public static color getColor() {
    return c;
  }

  public static color[] getColors() {
    return colors;
  }
}

