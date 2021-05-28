#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main() {
    char s[200] = "echo ";
    puts("Enter anything, and I will print that out");
    fgets(s + 5, 100, stdin);
    system(s);
    return 0;
}
