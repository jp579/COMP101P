// written by janos potecki 15 oct 2015
/*
Write the following programs:
a) To print the squares of the numbers from 1 to 100.
b) To print the squares of the even numbers between 1 and 101.
c) To print the prime numbers between 1 and 100.
 */

#include <stdio.h>

void squares(int num){
  printf("square of %i is %i\n" , num, num * num);
}

void printSquares(int begin, int end, int bool){
  for(unsigned int i = begin; i < end; i++){
    if( (bool == 1 && i % 2 == 0) || bool == 0) 
      squares(i);
  }
}

int isPrime(int number){
  for(unsigned int i = 2; i < number; i++){
    if(number % i == 0)
      return 0;
  }
  return 1;
}

void prime(int end){
  for(unsigned int i = 2; i < end; i++){
    if(isPrime(i) == 1)
      printf("%i\n", i);
  }
}

int main(void){
  printf(" a)\n");
  printSquares(1, 101, 0);
  printf(" b)\n");
  printSquares(1, 101, 1);
  printf(" c)\n");
  prime(100);
  return 0;
}
