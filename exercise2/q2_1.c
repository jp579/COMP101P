// written by janos potecki 12th oct 2015
// Write a program using a while loop to display the thirteen times table

#import <stdio.h>

int main(void){

  int i = 0;
  while(++i <= 10){
    printf("%i * 13 = %i\n",i , i*13);
  }

}
