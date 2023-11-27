.section .text
.align 3
.global main
main:
	mov x0, #0xa
	mov v0.h[1], w0
	ret
