// written by janos potecki
/*
 Write a program that takes a block of text and formats it into two columns,
 so that the text can be printed on the screen in the two columns.
 Each column should be forty characters wide and text should be adjusted so
 that only complete words show on each line. Make use of pointers, strings
 (character arrays), with all memory allocated dynamically on the heap.
Additional challenges:
i) Read the original text from a file.
ii) Write the formatted text out to a file.
iii) Allow the number and width of columns to be specified.
iv) Add support for hyphenation, allowing words to be split across two lines.
*/

#import <stdio.h>
#import <stdlib.h>
#import <string.h>

int allowedChar(char c){
	switch(c){
		case ' ':
		case '\n': return 1;
		default: return 0;
	}
}

int getNumberOfLines(int characters, int charsPerColumn){
	return characters / charsPerColumn;
}

int fillColumns(char* s, int charsOfS, char* arr, int columns, int numOfLines, int charsPerLine){
	int insertedChars = 0;
	int ac = 0;
	int counter = 0;
	for(int i = 0; i < charsOfS; i++, ac++){
		if( ac % (charsPerLine-1) == 0 && ac != 0){
				while(!allowedChar(s[i])){
					i--;
					arr[ac-counter] = ' ';
					insertedChars++;
					counter++;
				}
				arr[ac] = s[i];
				insertedChars++;
				counter = 0;
				//printf("copied s[%c]" , s[i]);
		}
		else
			arr[ac] = s[i];
			insertedChars++;
	}
	return insertedChars;
}

int main(void){
	char s[] = "Write a program that takes a block of text and formats it into two columns, so that the text can be printed on the screen in the two columns. Each column should be forty characters wide and text should be adjusted so that only complete words show on each line. Make use of pointers, strings (character arrays), with all memory allocated dynamically on the heap \nAdditional challenges: \ni) Read the original text from a file.\nii) Write the formatted text out to a file.\niii) Allow the number and width of columns to be specified.\niv) Add support for hyphenation, allowing words to be split across two lines.";

	int columns = 2;
	int charsPerLine = 40;
	int numOfLines = (getNumberOfLines(sizeof(s) / sizeof(char), charsPerLine) + 1) * 2;
	int arrSize = sizeof(char) * columns * numOfLines * charsPerLine + 1;
	char* arr = malloc(arrSize);
	arr[arrSize] = '\0';
	memset(arr, ' ', sizeof(char) * columns * numOfLines * charsPerLine);
	printf("Lines: %d\n", numOfLines);

	int totalchars = fillColumns(s, sizeof(s) / sizeof(char), arr, columns, numOfLines, charsPerLine);
	numOfLines = getNumberOfLines(totalchars, charsPerLine);

	for (int line = 0; line < numOfLines; line++){
		int pos = 0;
		for(int i = 0; i <  charsPerLine; i++){
			pos = line*charsPerLine+i;
			printf("%c" , arr[pos]);

			if((pos) % 39 == 0 && pos != 0)
				printf("\n");
		}
	}

	return 0;
}
