#include <stdio.h>
#include <string.h>

int main() {
	char s[20];
	fgets(s, 19, stdin);
	printf(s);
	//printf("%2$d\n", 1, 2, 3);

}
