// written by janos potecki 23 oct 2015
/*a program that defines and calls a function to raise an integer to a positive integer power (e.g., x^y). Provide a version of the function that uses a loop and another that uses recursion.
 */

#import <math.h>
#import <stdio.h>

void readInput(int arr[2]){
  scanf("%d %d" , &arr[0], &arr[1]);
}

int powerLoop(int x, int y){
  int result = x;
  for(; y > 1; y--)
    result *= x;
  return result;
}

int powerRecursive(int x, int y){
  if (y <= 1)
    return x;
  return powerRecursive(x, y-1) * x;
}

int main(void){
  int arr[2];
  readInput(arr);
  printf(" loop x^y : %d \n", powerLoop(arr[0],arr[1]));
  printf(" recursive: %d \n", powerRecursive(arr[0],arr[1]));
  return 0;
}
