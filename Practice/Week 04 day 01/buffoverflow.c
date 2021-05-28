#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char s[20];
    int N = 5;
    for (int i = 0; i < N; i++) {
        puts("Enter a string");
        gets(s);
        printf("i = %d N = %d\n", i, N);
    }   
}
