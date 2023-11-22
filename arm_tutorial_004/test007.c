#include <stdio.h>

#define MY_OPS(op)  \
static inline int my_ops_##op(int* addr) \
{\
	int result = 0; \
	asm volatile (	\
	"ldrh w7, [%[addr]]\n" \
	" "#op"  w7, w7, #1\n" \
	"mov %w[result], w7\n" \
	: [result]"+r"(result) \
	: [addr]"r"(addr) \
	: "memory" \
	);\
	return result;\
}


MY_OPS(add)
int main(void) {
	int a = 2;
	int* p = &a;
	int b = my_ops_add(p);
	printf("%d\n", b);
	return 0;
}
