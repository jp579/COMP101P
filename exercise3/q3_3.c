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

long int myPow(long int a, int b){
  if(b == 0) return 1;
  long int num = a;
  for(; b > 1; b--)
    num *= a;
  return num;
}

long int reverse(long int number){
  long int num = 0;
  int digits = getDigits(number); 
  for(int i = 1; i <= digits; i++){
    long int tmp = number % myPow(10, 1);
    number = number / 10;
    num += tmp * myPow(10, digits-i);
  }
  return num;
}
int main(void){
  long int a;
  a = readInput();
  printf("is");
  if ( a != reverse(a)) printf(" not");
  printf(" a palindrome\n" );
  return 0;
}
