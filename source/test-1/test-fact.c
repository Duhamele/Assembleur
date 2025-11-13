#include "cal.h"
#include <stdio.h>

int main() {
    nombre_fact_t x = {10, 2};
    nombre_fact_t y = {5, 8};
    nombre_fact_t r = add_fact(x, y);

    printf("quotient = %lu, diviseur = %lu\n", r.quotient, r.diviseur);
    return 0;
}

