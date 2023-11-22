#include <stdio.h>

void isOK(int a) {
	asm goto(
		"mov w5, %w[a]\n"
		"cmp w5, #1\n"
		"b.eq %l[label]\n"
		:
		: [a]"r"(a)
		: "memory", "cc"
		: label
		);
	return;
label:
	printf("%d\n", a);
	return;
}

int main(void) {
	isOK(1);
	isOK(2);
	return 0;
}
