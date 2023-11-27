.section .data
.align 3
my_data1:
	.word 1,2,3,4,5,6,7,8

.section .text
.align 3
.global main
main:
	ldr x0, =my_data1
	ld1 {v0.8h}, [x0]
	rev32 v1.8h, v0.8h
	ret
	
