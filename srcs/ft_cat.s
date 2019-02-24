section .text
global	_ft_cat

_ft_cat:
	push rbp
	mov rbp, rsp
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
	mov rsp, rbp
	pop rbp
	ret

section .data
buf times 0x400 db 0x0
size equ $ - buf
