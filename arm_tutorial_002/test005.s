.section .data
.align 8

my_data:
	.word 3 
	.word 1
	.word 4
	.word 2
	.word 5 
	.word 3
my_data_len:
	.word 4

str1:
	.string "func_a"

str2:
	.string "func_b"

str3:
	.string "func_c"


print_data:
	.string "function name is %s\n"

scanf_data:
	.string "%d"

.section .text
.align 8


.global find_symbol
find_symbol:
	stp x29, x30, [sp, -16]!
	ldr x2, =my_data_len
	ldr x1, =my_data
	cmp x1, x2
L1:
	ldr w4, [x1]
	cmp w0, w4
	b.eq L3
	add x1, x1, 4
	b L1
L3:
	ldr w5, [x1, 4]
	mov w0, w5
	stp x29, x30, [sp], 16
	ret
	


.global main
main:
	stp x29, x30, [sp, -16]!
	sub sp, sp, 8
	
	// call scanf
	mov x1, sp
	ldr x0, =scanf_data
	bl scanf 
	
	// call find_symbol
	ldr w0, [sp]
	bl find_symbol
	
	// call printf
	mov x2, x0
LL1:
	cmp x2, 1
	ldr x1, =str1
	b.eq LL4
LL2:
	cmp x2, 2
	ldr x1, =str2
	b.eq LL4
LL3:
	cmp x2, 3
	ldr x1, =str3
	b.eq LL4
LL4: 
	ldr x0, =print_data
	bl printf
	

	add sp, sp, 8
	ldp x29, x30, [sp], 16
	ret
