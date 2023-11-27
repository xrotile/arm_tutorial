.section .data
.align 3
my_data1:
	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12

.section .text
.align 3
.global main
main:
	ldr x0, =my_data1
	ld3 {v0.16b, v1.16b, v2.16b}, [x0]
	mov v3.16b, v1.16b
	mov v1.16b, v0.16b
	mov v0.16b, v3.16b
	mov x1, x0

