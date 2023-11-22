#include <stdio.h>

// memset by own

void memset_(int* a, int size, int val) {
	int len = 0;
	asm volatile(
		"1:strh %w[val], [%[src]]\n"
		"add %[len], %[len], #1\n"
		"add %[src], %[src], #4\n"
		"cmp %w[len], %w[size]\n"
		"bne 1b\n"
		: [src]"+r"(a), [len]"+r"(len)
		: [size]"r"(size), [val]"r"(val)
		: "memory", "cc"
	);
}

#define SIZE 10
int a[SIZE];
int main(void) {
	memset_(a, SIZE, 1);
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", a[i]);
	}
	printf("\n");
	return 0;
}
