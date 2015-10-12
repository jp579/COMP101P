// Written by Janos Potecki 8.Oct. 2015
// a programm which draws a sin curve

#include "graphics.h"
#include <math.h>
#include <stdbool.h>

int main(void)
{
  
  
  int x = -150;

  do{
    double sinValue = sin(x/10.0);
    
    int drawable;
    
    if ( (sinValue / 10) <= 0.5)
      {
	drawable = (sinValue + 1) * 10;
      }
    else
      {
	drawable = sinValue * 10;
      }
    drawRect(x-253, drawable+140, 1, 1);
    x++;
  } while (x < 751);

   
      drawLine(250,  10, 250, 290);
      drawLine(250,  10, 243,  20);
      drawLine(250,  10, 257,  20);
      drawLine(250, 290, 243, 280);
      drawLine(250, 290, 257, 280);
      
      drawLine( 20, 150, 490,  150);

}
