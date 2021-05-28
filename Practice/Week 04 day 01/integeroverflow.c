#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

int main() {
    int8_t a = 125;
    for(int i = 0; i < 10; i++) {
        a++;
        printf("a = %d \n", a);
    }
    uint8_t b = -1;
    printf("b = %u \n", b);
}
