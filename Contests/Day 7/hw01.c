#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

void win() {
    int fd = open("/home/hw01/flag.txt", O_RDONLY);
    char s[100];
    size_t n = read(fd, s, 50);
    s[n] = 0;
    close(fd);
    puts(s);
}

int main() {
    /* Does not matter. This is setup */
    setvbuf(stdin, NULL, _IONBF, 0);
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
    char s[20];
    printf("win function is at %p. Put this before returning to win function %p. Give me a string now: ", win, (win+101));
    gets(s);
    puts("Let's see if you win...");
    return 0;
}
