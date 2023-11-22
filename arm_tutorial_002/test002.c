#include <stdio.h>

int max_value(int a, int b) {
	if (a > b) {
		return a;
	}
	return b;
}

int main(void) {
	int a = 1, b= 2;
	int c = max_value(a, b);
	printf("data %d\n", c);
	return 0;
}
