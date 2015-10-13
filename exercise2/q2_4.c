// written by janos potecki 13 oct 2015
/* a program to display the following:
*****
*   *  
*   *   
*****
You may display only one character at a time. You cannot have a statement such as:
printf(“*****”);
to output an entire line at once. A loop must be used to write characters one at a time. Space characters should be output to display the spaces inside the shape.
Hint: nested loop.*/

#import <stdio.h>

int main(void){
  
  // loop through every line
  for(int i = 0; i < 4; i++){
    
    // loop for every char
    for(int j = 0; j < 5; j++){
      if(i == 0 || i == 3)
	printf("*");
      else {
	if(j == 0 || j == 4)
	  printf("*");
	else
	  printf(" ");
      }
    }
    printf("\n");
  }
  return 0;
}
