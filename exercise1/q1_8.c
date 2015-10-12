// Written by Janos Potecki 6.Oct.2015
// a program to draw a series of ovals of increasing size

#include "graphics.h"

int main(void)
{
  int radius = 300;
  int middleX = 150;
  int middleY = 150;
  
  do{
    drawOval(middleX-radius/2, middleY-radius/2, radius, radius);
    radius -= 30;
  } while (radius > 0);
}
