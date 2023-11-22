.section .data
.align 3

my_data1:
	.quad 2

.section .text
.global main
main:
	ldr x0, =my_data1
	adr x1, my_data1
	mov x2, x1

