// memory copy
#include <stdlib.h>
#include <stdio.h>

static inline void memcpy_(const int* src, const int* dst, int size)
{

	int len = 0;
	asm volatile (
			"1:  ldrh w8, [%0]\n"
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

#define SIZE 11
int a[SIZE];
int b[SIZE];
int main(void) {
	for (int i = 0; i < SIZE; i++) {
		a[i] = i + 1;
	}
	printf("old data is:\n");
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", a[i]);
	}
	printf("\n");
	memcpy_(a, b, SIZE);
	printf("new data is:\n");
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", b[i]);
	}
	printf("\n");

	
	return 0;
}
