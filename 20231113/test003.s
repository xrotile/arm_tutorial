// mininum value
.section .data
.align 3

my_data1:
	.quad 100

my_data2:
	.quad 20

scanf_fmt:
	.string  "max value: %d.\n"

.section .text
.align 3

.global main
main:
	stp x29, x30, [sp, -16]!	

	ldr x0, =my_data1
	ldr x2, [x0]
	
	ldr x0, =my_data2
	ldr x3, [x0]

	cmp x2, x3
	csel x1, x2, x3, ge
	ldr x0, =scanf_fmt
	bl printf

	ldp x29, x30, [sp], #16
	ret

