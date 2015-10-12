// Written by Janos Potecki 6.Oct.2015
// a program to draw two rectangles

#include "graphics.h"

int main(void)
{
  // drawRect(30,30,90,50);
  
  drawLine(30,30,120,30);
  drawLine(30,30,30,80);
  drawLine(30,80,120,80);
  drawLine(120,80,120,30);

  drawRect(150,50,60,140);
}
