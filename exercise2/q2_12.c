// written by janos potecki 15 oct 2015
/*
Q2.12 Write a drawing program that draws a graph showing the curves y=sin(x), y=cos(x) and y =
tan(x). Include properly labelled axes, to look like the example below:
Choose suitable ranges for the axes of the graph to show the curves to the best effect.
Hints: Break the drawing of the graph down into a series of steps: draw the x-axis, label the x-axis, draw the y-axis, label the y-axis, etc. Use loops to draw the curves using points. A point can be drawn using a 1x1 rectangle. Remember that on the window co-ordinate system (0,0) is top left, so you will have to take care when you compute the coordinates of lines and points.
How do you compute Sin, Cos, Tan? See the functions in the standard C library. For example, double sin(double) will return the sin of double value (note value needs to be specified in radians or convert degrees to radians).
*/

#import "graphics.h"
#import <math.h>
#import <stdio.h>
#import <stdlib.h>

#define PI 3.14159265


int* convertIntoPixel(double x, double y);

void drawCosy(){
  // x,y axis
  drawLine(250,   0, 250, 300);
  drawLine(  0, 150, 500, 150);

  // values at y axis
  for(double y = -2.4; y <= 2.1; y += 0.5){
    // pixel x = arr[0]
    // pixel y = arr[1]
    int* arr = convertIntoPixel(0.0, y);
    drawLine(arr[0] - 10, arr[1], arr[0] + 10, arr[1]);
    
    // now the numbers
    int num = abs((int) y);
    int floating = y * 10;
    if (floating < 0)
      floating = abs(floating);
    floating -= num * 10;
    char string1[1];
    char string2[1];
    string1[0] = num + '0';
    string2[0] = floating + '0';
    if(y < 0)
      drawString("-", arr[0] + 10, arr[1]);
    drawString(string1 , arr[0] + 20, arr[1]);
    drawString(".", arr[0] + 28, arr[1]);
    drawString(string2 , arr[0] + 36, arr[1]);
  } 
  // now x axis
  for(double x = -360.0; x < 360.0; x += 90.0){
    int* arr = convertIntoPixel(x, 0.0);
    drawLine(arr[0], arr[1] - 10, arr[0], arr[1] + 10);
  }
}

int roundDoubles(double x){
  if (x == 0.0)
    return x;
  if (x > 0.0)
    return x + 0.5;
  return x - 0.5;
}

int* convertIntoPixel(double x, double y){
  // e.g.  input:  x =   0.0,  y =   0.0
  //      output: px =   250, py = 150
  
  //       input:  x = -90.0,  y =   0.0
  //      output: px =   160, py = 150
  
  //       input:  x =   0.0,  y =   1.0
  //      output: px =   250, py =  90
   
  double outputX = 250 + x;
  outputX = roundDoubles(outputX);
  
  y = y * 2 * 30;
  double outputY = 150 - y;  
  outputY = roundDoubles(outputY); 
  
  static int arr[2];
  arr[0] = (int) outputX;
  arr[1] = (int) outputY;
  
  return arr;

}

void drawCosSinTan(){
  for(double x = -360.0; x < 360.0; x+= 0.1){
    double y = sin(x * PI/180);
    int* pixel = convertIntoPixel(x, y);
    setColour(green);
    drawRect(pixel[0], pixel[1], 1, 1);
    
    y = cos(x * PI/180);
    pixel = convertIntoPixel(x, y);
    setColour(red);
    drawRect(pixel[0], pixel[1], 1, 1);
    
    y = tan(x * PI/180);
    pixel = convertIntoPixel(x, y);
    setColour(yellow);
    drawRect(pixel[0], pixel[1], 1, 1);
  }
  return;
}

int main(void){
  drawCosy();  
  drawCosSinTan();
  return 0;
}
