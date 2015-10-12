// written by janos potecki 12 oct 2015
// repeat q2.1 using do loop

#import <stdio.h>

int main(void){

  int i = 0;
  do{
    i++;
    printf("%i * 13 = %i\n", i, i*13);
  } while(i < 10);
}
