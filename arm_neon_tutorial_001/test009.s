.section .data
.align 3
my_data1:
	.byte 1,2,3,4,5,6,7,8

.section .text
.align 3
.global main
main:
	ldr x0,=my_data1
	ld3 {v0.b, v1.b, v2.b}[4], [x0]
	ret
