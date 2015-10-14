// written by janos potecki 14. oct 2015
/*
 a program to display the following:
 ******
  *****
   ****
    ***
     **
     *
*/

#include <stdio.h>

int main(void){
  int stars = 6;
  for(int i = stars; i > 0; i--){
    for(int j = 0; j < stars-i; j++)
      printf(" ");
    for(int j = 0; j < i; j++)
      printf("*");
    printf("\n");
  } 
}

