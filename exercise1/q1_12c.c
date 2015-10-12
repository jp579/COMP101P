// written by janos potecki 10.oct 2015
// write a fractal

#import <math.h>
#import "graphics.h"

void fractal(int aX, int aY, int bX,int bY,int depth)
{
  if(depth >= 4)
    return;

  int vX = bX - aX;
  int vY = bY - aY;
  
  float cX = aX + 1/3 * vX;
  float cY = aY + 1/3 * vY;

  float dX = bX - 1/3 * vX;
  float dY = bY - 1/3 * vY;

  float mX = aX + 1/2 * vX;
  float mY = aY + 1/2 * vY;
  
  float oX = vY * -1;
  float oY = vX;

  float o = sqrt(oX * oX + oY * oY);
  
  oX /= o;
  oY /= o;
 
  float length = sqrt(1/9 * vX * vX + 1/9 * vY * vY);
  float h = sqrt(3)/2 * length;

  int pX = mX + oX * h;
  int pY = mY + oY * h;
  
  drawLine(pX, pY, cX, cY);
  drawLine(pX, pY, dX, dY);
  
  depth++;
  
  fractal(cX, cY, pX, pY, depth);
  fractal(dX, dY, pX, pY, depth);
  
  return;
}



int main(void)
{
  drawLine( 50, 100, 150, 100);
  drawLine( 50, 100, 100, 150);
  drawLine(100, 150, 150, 100);
  
  fractal( 50, 100, 150, 100, 0);
  fractal( 50, 100, 100, 150, 0);
  fractal(100, 150, 150, 100, 0);
  return 0;
}
