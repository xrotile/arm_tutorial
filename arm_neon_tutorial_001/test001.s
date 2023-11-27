// load

.section .data
.align 3
my_data1:
	.word 1,2,3,4 


.section .text
.align

.global main
main:
	ldr x0, =my_data1
	ld1 {v0.4s}, [x0]
	mov x1, x0
	
	
