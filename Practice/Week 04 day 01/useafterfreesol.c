#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct dog {
    void (*bark)();
} dog;

typedef struct cat {
    void (*meow)();
} cat;

void bark() {
  puts("go go go...");
}

void meow() {
  puts("bruh.");
}


void weird() {
   cat *c = malloc(sizeof(cat));
   free(c);
   /* use only dog stuff here, no cat ever */
   // Let's make this cat say "go go go ..."
   dog* d = malloc(sizeof(dog));
   d->bark = bark;
   c->meow();
}

void good() {
   dog *d = malloc(sizeof(dog));
   cat *c = malloc(sizeof(cat));
   d->bark = bark;
   c->meow = meow;
   d->bark();
   c->meow();
   free(c);
   free(d);
}

int main() {
    good();
    weird();
}
