// written by janos potecki

/*
a program that inputs the time in 24 hour format and prints it out in 12 hour format. 
For example, 20:08 would be printed as 8.20pm. Note that scanf can be used to match 
patterns like this:
scanf("%d:%d", &hours, &minutes); // Match input like 20:08
*/

#import <stdio.h>

void readAndInsertData(int arr[3]){
	int hours;
	printf("Please type in the time to be converted: HH:MM\n");
	scanf("%2d:%2d" , &hours, &arr[1]);
	// 0 = am ; 1 = pm
	if(hours < 12 || hours == 24) 
		arr[2] = 0;
	else
		arr[2] = 1;
	if (hours == 12 || hours == 24 || hours == 0) 
		arr[0] = 12;
	else
		arr[0] = hours % 12;
	return;
}

int main(void) {
	int arr[3] = {0 , 0, 0 };
	readAndInsertData(arr);
	printf("%02i:%02i", arr[0], arr[1]);
	(arr[2] == 0) ? printf("am\n") : printf("pm\n");
	return 0;
}