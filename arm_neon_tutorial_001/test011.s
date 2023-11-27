.section .text
.align 3
.global main
main:
	mov w0, 0xa
	mov v0.b[1], w0
	mov b1, v0.b[1]
	ret

