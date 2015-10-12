// Written by Janos Potecki 6.Oct.2015
// a program to draw two rectangles

#include "graphics.h"
#include <math.h>

float calcSideLength(int radius)
{
  return sqrt(2 * (radius * radius) );
}

int distanceMiddleToSquareborder(float side, int radius)
{
  return sqrt(radius * radius - 0.25 * side * side);
}



int main(void)
{
  int radius = 100;
  float side = calcSideLength(radius);
  int dMiddle = distanceMiddleToSquareborder(side, radius);
  int move = radius - dMiddle;
  drawRect(100+move, 100+move, side, side);
  drawArc(100, 100, radius*2, radius*2, 0, 360); 
}
