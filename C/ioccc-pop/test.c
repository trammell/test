#include <stdio.h> 

int main() {
    char x = 0;

    printf("%d\n", x);

    printf("%1$.*2$d%3$hhn", 5, 10, &x); /* x = 10 */

    printf("\n");
    printf("%d\n", x);
}

