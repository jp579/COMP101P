// written by janos potecki
/*
Q4.1 Write a version of the string copy function that takes a single string argument and 
creates a new copy in dynamic (heap) memory. The function signature should be:
char* stringCopy(char *s)
*/

#import <stdio.h>
#import <stdlib.h>

char* stringCopy(char *s){
	int size = 0;
	for(int i = 0; s[i] != '\0'; i++){
		size++;
	}
	char *newS = (char *) malloc(size+1);
	for (int i = 0; i < size; i++)
		newS[i] = s[i];
	newS[size] = '\0';
	return newS;
}

int main(void){
	char s[5] = {'H', 'e', 'l', 'l','o'};
	char *newS = stringCopy(s);
	printf("%s\n", newS);
	free(newS);
	return 0;
}