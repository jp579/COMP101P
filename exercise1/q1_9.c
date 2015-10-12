// Written by Janos Potecki 05. Oct 2015
// This program displays my name.

#include "graphics.h"

int main(void) 
{
  char name[] = "Dept. of Computer Science";
  char building[] = "Malet Place Engineering Building";
  char street[] = "66-72 Gower Street";
  char code[] = "WC1E 6BT";
  char city[] = "London";
 
  drawString(name, 0,20);
  drawString(building, 0, 40);
  drawString(street, 0, 60);
  drawString(code, 0, 80);
  drawString(city, 0, 100);
  return 0;
}
