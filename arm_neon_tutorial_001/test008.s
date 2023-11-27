.section .data
.align 3
my_data1:
	.byte 1, 2, 3, 4

.section .text
.align 3
.global main
main:
	ldr x0, =my_data1
	ld2r {v0.16b, v1.16b}, [x0]
	ret

