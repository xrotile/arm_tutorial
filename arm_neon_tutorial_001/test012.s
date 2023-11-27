.section .text
.align 3
.global main
main:
	mov w0, 0x2
	mov v0.h[2], w0
	mov v1.h[2], v0.h[2]
	ret
