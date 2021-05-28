#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main() {
    uint8_t a = 100;
    int8_t b = 200;
    if (a > b) {
        puts("yes");
    }
    else {
        puts("no");
    }
    return 0;
}
