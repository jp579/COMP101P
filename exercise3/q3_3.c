// written by janos potecki 23 oct 2015
/* a program to determine if a long int is a palindrome (i.e., represents the same value when reversed, for example 123454321).*/

#include <stdio.h>

long int readInput(){
  long int a;
  scanf("%ld", &a);
  return a;
}

int getDigits(long int number){
  int digits = 0;
  while (number){ 
    number /= 10;
    digits++;
  }
  return digits;
}

long int reverse(long int number){
  long int new = 0;
  int powerofTen = 1;
  printf("digits: %d\n", getDigits(number)); 
  //for(int i = 1, digits = getDigits(number); i <= digits; i++){
  return 0;  
}
int main(void){
  long int a;
  a = readInput();
  long b = reverse(a);
  return 0;
}
