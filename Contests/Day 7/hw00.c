#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

void readflag() {
    int fd = open("/home/hw01/flag_1832.txt", O_RDONLY);
    char s[100];
    size_t n = read(fd, s, 50);
    s[n] = 0;
    puts(s);
}

int main() {
    char s[20];
    puts("Give me input: ");
    fgets(s, 19, stdin);
    if (*(unsigned long long *)s == 0xdeadbeef12345678)  {
	readflag();
    }
    return 0;
}
