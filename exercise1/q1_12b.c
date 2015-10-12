

#include <math.h>
#include "graphics.h"

void frac(aX, aY, bX, bY, depth){
  if (depth >= 3)
    return;
  
  drawLine(aX, aY, bX, bY);

  int vX = bX - aX;
  int vY = bY - aY;
 
  
  aX = aX + vX / 3;
  aY = aY + vY / 3;

  bX = bX - vX / 3;
  bY = bY - vY / 3;

  vX = bX - aX;
  vY = bY - aY;
  
  int oX =  vY;
  int oY =  -vX;
  
  float d = sqrt(vX * vX + vY * vY);
  float h = sqrt(3) / 2 * d;
  
  int mX = aX + vX / 2;
  int mY = aY + vY / 2;
  // normalize o
  oX /= d;
  oY /= d;
  mX -= oX * h;
  mY -= oY * h;

  depth++;
  frac(aX, aY, mX, mY, depth);
  frac(bX, bY, mX, mY, depth);
  return;
}

int main(void)
{
  frac( 50, 50, 150, 50, 1);
  frac( 50, 50, 100,100, 1);
  frac(100,100, 150, 50, 1);
}
