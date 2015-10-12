// Written by Janos Potecki 9. Oct. 2015
// draw a fractal shape

#include <stdio.h>
#include <math.h>
#include "graphics.h"

int maxDepth;

int calcHeight(int sideLength)
{
  return sqrt(3) / 2 * sideLength;
}

int* calcNewPoint(int aX, int aY, int bX, int bY)
{
  // vector : v = (bX - aX | bY - bX)
  // middle:  0.5 * (vX, vY) = (mX | mY ) 
  // orthogonal: o = (-vY, vX)
  // normalize o
  // multipliy o with dist(A;B)
  // new point: o + m
  int vX = bX - aX;
  int vY = bY - aY;
  int mX = 0.5 * vX;
  int mY = 0.5 * vY;
  int oX = -vY;
  int oY = vX;
  // calc d(A;B)
  float d = sqrt(vX * vX + vY * vY);
  // calc height of the triangle
  float h = sqrt(3) / 2 * d;
  
  // normalize o and multiply with h
  float n = sqrt(oX * oX + oY * oY);
  oX /= n * h;
  oY /= n * h;
  
  // apply distance
  oX *= d;
  oY *= d;

  static int newPoint[2];
  newPoint[0] = oX + mX;
  newPoint[1] = oY + mY;
  return newPoint;
}

void fractal(int aX,int aY,int bX,int bY, int depth) 
{
  if(depth > 1)
    return;
  
  int vX = bX - aX;
  int vY = bY - aY;

  aX += vX / 3; 
  aY += vY / 3;
  bX -= vX / -3;
  bY -= vX / -3;

  int* newPoint = calcNewPoint(aX, aY, bX, bY);
  drawLine(aX + 40, aY + 20, newPoint[0] +40, newPoint[1] + 20);
  drawLine(bX + 40, bY + 20, newPoint[0] +40, newPoint[1] + 20);
  fractal(aX, aY, newPoint[0], newPoint[1], depth+1);
  

  return;
  
}

int main(void)
{
  int aX = 0;
  int aY = 0;
  
  int bX = 90;
  int bY = 0;
  
  //int maxDepth = 3;
  
  fractal(aX, aY, bX, bY, 0); 
  return 0;
}
