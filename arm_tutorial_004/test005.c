#include <stdio.h>
#include <stdlib.h>


void memcpy1(int* src, int * dst, int size) {
	int len = 0;
	asm volatile(
		"1: ldrh w5, [%[src]], #4\n"
		"strh w5, [%[dst]], #4\n"
		"add %w[len], %w[len], #1\n"
		"cmp %w[len], %w[size] \n"
		"bne 1b\n"
		: [src] "+r"(src), [dst]"+r"(dst), [len]"+r"(len)
		: [size] "r"(size)
		: "memory", "cc"
	);
}

#define SIZE 12
int a[SIZE];
int b[SIZE];
int main(void) {
	for (int i = 0; i < SIZE; i++) {
		a[i] = i + 1;
	}
	
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", a[i]);
	}	
	printf("\n");
	memcpy1(a, b, SIZE);
	for (int i = 0; i < SIZE; i++) {
		printf("%d ", b[i]);
	}	
	printf("\n");
	

	return 0;
}
