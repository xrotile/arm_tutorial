.section .data
.align 3

.print_data
	.string "print data %d.\n"


.section .text
.align 3

.global max_value
max_value:
	stp x29, x30, [sp, -16]!
	
	cmp x1, x2
	csel x0, x1, x2, ge
	
	ldp x29, x30, [sp], 16
	ret	
	
