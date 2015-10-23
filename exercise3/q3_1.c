// written by janos potecki 23 oct 2015
/*a program to input the length of the sides of a triangle, and prints the area and length of the perimeter of the triangle. If the input values do not represent a triangle then display an error message instead.*/

#import <stdio.h>
#import <math.h>

double calcPerimeter(double arr[3]){
  return arr[0] + arr[1] + arr[2];
}

double calcSemiperimeter(double arr[3]){
  return 0.5 * calcPerimeter(arr);
}

double calcArea(double arr[3]){
  double s = calcSemiperimeter(arr);
  return sqrt( s*(s-arr[0])*(s-arr[1])*(s-arr[2]) );
}

void readInput(double arr[3]){
  printf("please enter the length of each side of the triangle\n");
  printf("seperate the numbers by whitespace\n");
  scanf("%lf %lf %lf", &arr[0], &arr[1], &arr[2]);
}

int main(void){
  double arr[3];
  readInput(arr);
  printf("Perimeter: %.2lf \n" , calcPerimeter(arr));
  printf("Area: %.4lf \n" , calcArea(arr));
  return 0;
}
