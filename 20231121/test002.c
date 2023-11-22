// add asm
#include <stdio.h>

static inline int add(int a, int b) {
	int c;
	asm volatile(
		"add %0, %1, %2\n"
		: "=r"(c)
		: "r"(a), "r"(b)
		:
	);
	return c;
}


int main(void) {
	int c = add(1, 2);
	printf("%d\n", c);
	return 0;
}
