.section .data
.align 3
my_data1:
	.short 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16

.section .text
.align 3
.global main
main:
	ldr x0, =my_data1
	ld1 {v0.8h, v1.8h}, [x0]
	ext v2.16b, v0.16b, v1.16b, #2
	ld1 {v0.8h, v1.8h}, [x0]
	zip1 v2.8h, v0.8h, v1.8h
	zip2 v2.8h, v0.8h, v1.8h
	ret
