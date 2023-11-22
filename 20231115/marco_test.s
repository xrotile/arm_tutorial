.section .data
.align 3
my_data1:
	.quad 1

my_data2:
	.quad 4

print_data:
	.string "data is %d.\n"

.section .text
.align 3
.global add_1
add_1:
	add x0, x0, x1, lsl 1
	ret

.global add_2
add_2:
	add x0, x0, x1
	ret


.macro add a, b, label
mov x0, \a
mov x1, \b
bl add_\label
.endm

.global main
main:
	stp x29, x30, [sp, -16]!
	ldr x4, =my_data1
	ldr x5, [x4]
	ldr x4, =my_data2
	ldr x6, [x4]
	add x5, x6, 2
	
	mov x1, x0
	ldr x0, =print_data
	bl printf
	ldp x29, x30, [sp], 16
	ret
