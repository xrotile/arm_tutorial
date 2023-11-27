.section .data
.align 3
my_data1:
	.word 1, 2, 3, 4, 5, 6, 7, 8

my_data2:
	.word 9,8,7,6,5,4,3,2

.section .text
.align 3
.global main
main:
	ldr x0, =my_data1
	ld1 { v0.4s, v1.4s }, [x0]
	ldr x1, =my_data2
	st1 { v0.4s, v1.4s }, [x1]
	mov x1, x0
