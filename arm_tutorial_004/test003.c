#include <stdio.h>

static inline void swap_data(const int* src, const int* dst, int size)
{
	
	int len = 0;
	asm volatile (
		"1:  ldrh w8, [%0]\n"
		"ldrh w9, [%1]\n"
		"strh w9, [%0]\n"
		"strh w8, [%1]\n"
		"add %2, %2, #1\n"
		"add %0, %0, #4\n"
		"add %1, %1, #4\n"
		"cmp %2, %5\n"
		"bne 1b\n"
		: "+r"(src), "+r"(dst), "+r"(len)
		: "r"(src), "r"(dst), "r"(size)
		: "memory", "cc"
	);
}

#define SIZE 10
int a[SIZE];
int b[SIZE];
int main(void) {
	for (int i = 0; i < SIZE; i++) {
		a[i] = 9 - i;
	}	
	
	for (int i = 0; i < SIZE; i++) {
		b[i] = i;
	}
	
	printf("old data is:\n");
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", a[i]);
	}
	printf("\n");

	for (int i = 0; i < SIZE; i++) {
		printf("%d ", b[i]);
	}
	printf("\n");
	
	// swap data
	swap_data(a, b, SIZE);
	printf("new data is:\n");
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", a[i]);
	}
	printf("\n");

	for (int i = 0; i < SIZE; i++) {
		printf("%d ", b[i]);
	}
	printf("\n");
	return 0;
}
