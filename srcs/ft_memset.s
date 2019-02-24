section .text
global	_ft_memset

_ft_memset:
	push rbp
	mov rbp, rsp
	push rdi
	mov rax, rsi
	mov rcx, rdx
	cld
	rep stosb
	mov rax, rdi
	pop rax
	mov rsp, rbp
	pop rbp
	ret
