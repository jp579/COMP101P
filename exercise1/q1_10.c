// Written by Janos Potecki 05. Oct 2015
// This program draws a bar chart

#include "graphics.h"


// x,y coordinates where the next bar will be drawn
int barStartX = 31; 
int barStartY = 119;

int barWidth = 30;
int barHeightUnit = 20; // the unit is a multiplyer
                        
colour textcolour = 0;

void drawBar(int barSize, colour c, char title[])
{
  setColour(textcolour);
  drawString(title, barStartX, barStartY + 15);
  
  setColour(c);
  for(int i = 0; i < barWidth; i++)
    drawRect(barStartX++, barStartY-barSize, 1, barSize );
  
  barStartX++;

  //setColour(textcolour);
  //drawString(title, barStartX, barStartY + 10);
}


int main(void) 
{
  // draw the plane
  drawLine(30, 120,  30,  30);
  drawLine(28, 120, 328, 120);

  drawBar(70, 5, "UCL");
  drawBar(30, 3, "KCL");
  drawBar(70, 4, "Cam");
  drawBar(65, 7, "Oxf");
  drawBar(50, 8, "LSE");
  return 0;
}
