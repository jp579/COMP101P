// Written by Janos Potecki 5. Oct 2015
// Programm to draw a heptagon (7 sides)
// The Points were calculated with a tool
// http://www.mathopenref.com/coordpolycalc.html

#include "graphics.h"

int main(void)
{
  drawLine(250,10,141,63);
  drawLine(141,63,114,181);
  drawLine(114,181,189,276);
  drawLine(189,276,311,276);
  drawLine(311,276,386,181);
  drawLine(386,181,359,63);
  drawLine(359,63,250,10);
  
  return 0;
}
