.section .data
.align 8
my_data1:
	.word  1
my_data2:
	.word  2
print_data:
	.string "data is %d\n"

.section .text
.align 8
.global main
main:
	stp x29, x30, [sp, 16]!
	ldr x2, =my_data1
	ldr w0, [x2]
	ldr x3, =my_data2
	ldr w1, [x3]
	
	bl max_value
	mov w1, w0
	ldr x0, =print_data
	bl printf
	ldp x29, x30, [sp], 16
	ret
	
	
