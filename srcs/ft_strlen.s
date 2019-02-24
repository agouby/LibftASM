section .text
global	_ft_strlen

_ft_strlen:
	push rbp
	mov rbp, rsp
	push rdi
	xor rcx, rcx
	xor rax, rax
	not rcx
	cld
	repne scasb
	not rcx
	dec rcx
	mov rax, rcx
	pop rdi
	mov rsp, rbp
	pop rbp
	ret
