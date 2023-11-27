.section .data
.align 3
my_data1:
	.short 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16

my_data2:
	.rept 16
	.byte 2
	.endr

.section .text
.align 3
.global main
main:
	ldr x0, =my_data1
	ld1 {v0.8h, v1.8h}, [x0]
	trn1 v2.8h, v0.8h, v1.8h
	trn2 v3.8h, v0.8h, v1.8h
	ldr x0, =my_data2
	ld1 {v3.16b}, [x0]
	tbl v4.16b, {v0.16b, v1.16b}, v3.16b
	ret
