#include <stdio.h>
#include <string.h>

int main() {
    char c[] = "\x06\x07\x08\x09";
    char s[10];
    fgets(s, 9, stdin);
    if (c[0] == s[0] && c[1] == s[1] && c[2] == s[2] && c[3] == s[3]) {
	puts("yes");
    }
    else {
	    puts("no");
    }
    return 0;
}
