.section .data
.align 3

scanf_data:
	.string "%d"
val:
	.word 0

.section .text
.align 3
.global main
main:
	stp x29, x30, [sp, -16]!
	sub sp, sp, 8
	ldr x1, =val
	ldr x0, =scanf_data
	bl scanf 
	ldr x0, =val
	ldr x1, [x0]
	
	add sp, sp, 8
	ldp x29, x30, [sp], 16
	ret
