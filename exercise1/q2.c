// Written by Janos Potecki 05. Oct 2015
// This program displays my name.

#include <stdio.h>
#include <string.h>

 
void printBackwards(char string[]) {
  int index = strlen(string) - 1;
  while (index > -1)
    {
      printf("%c", string[index]);
      index = index - 1;
    }
  printf("\n");
}


int main(void) 
{
  char name[] = "Dept. of Computer Science";
  char building[] = "Malet Place Engineering Building";
  char street[] = "66-72 Gower Street";
  char code[] = "WC1E 6BT";
  char city[] = "London";
  printf("%s\n", name);
  printf("%s\n", building);
  printf("%s\n", street);
  printf("%s\n", code);
  printf("%s\n", city);
  
  printBackwards(name);
  printBackwards(building);
  printBackwards(street);
  printBackwards(code);
  printBackwards(city);
  
 
  return 0;
}
