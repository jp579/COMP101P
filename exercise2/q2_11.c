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
  for(int i = begin; i < end; i++){
    if( (bool == 1 && i % 2 == 0) || bool == 0) 
      squares(i);
  }
}


int main(void){
  printSquares(1, 101, 0);
  printSquares(1, 101, 1);
  //prime(100);
  return 0;
}
