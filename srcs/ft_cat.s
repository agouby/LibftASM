global	_ft_cat

section .text

_ft_cat:
	lea rsi, [rel buf]
	push rdi

_while:
	pop rdi
	mov rdx, size
	mov rax, 0x2000003
	syscall
	jc _exit
	and rax, rax
	je _exit
	mov rdx, rax
	push rdi
	mov rdi, 0x1
	mov rax, 0x2000004
	syscall
	jmp _while

_exit:
	ret

section .data
buf times 0x400 db 0x0
size equ $ - buf
