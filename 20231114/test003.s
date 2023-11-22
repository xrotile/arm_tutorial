.section .text
.global max_value
max_value:
	sub sp, sp, 8
	str w0, [sp, 8]
	str w1, [sp, 4]
	ldr w0, [sp, 8]
	ldr w1, [sp, 4]
	
	cmp w0, w1
	b.ge L1
	mov w0, w1
L1:
	add sp, sp, 8
	ret
	
	
