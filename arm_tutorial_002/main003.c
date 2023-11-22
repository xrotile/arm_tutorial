#include <stdio.h>

extern int max_value(int a, int b);

int main(void) {
	int a = 0, b = 2;
	int c = max_value(a, b);
	printf("data is %d\n", c);
	return 0;
}
