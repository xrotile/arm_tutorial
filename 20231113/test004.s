// scanf and printf 

.section .data
msg_input:
	.string "please input two number:\n"

printf_str:
	.string "the result is %d.\n"

scanf_fmt:
	.string "%d %d"


.section .text
.global main
main:
	stp x29, x30, [sp,-16]!
	
/*	ldr x0, =msg_input
	bl printf*/

	// accept two number
	sub sp, sp, 8
	mov x1, sp
	
	add x2, x1, 4
	
	ldr x0, =scanf_fmt
	bl  __isoc99_scanf


	ldr x3, [sp]
	ldr x4, [sp, 4]
	
	cmp x3, x4
	csel x1, x3, x4, ge

	ldr x0, =printf_str
	bl printf
	
	add sp, sp, 8
	ldp x29, x30, [sp], 16	

	ret
