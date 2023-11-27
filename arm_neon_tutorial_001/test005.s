.section .data
.align 3
my_data1:
	.word 1, 2, 3, 4, 5, 6, 7, 8

.section .text
.align 3
.global main
main:
	ldr x0, =my_data1
	ld2 {v0.4s, v1.4s}, [x0]
	mov x1, x0
