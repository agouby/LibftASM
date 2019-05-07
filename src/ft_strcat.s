section .text
global	_ft_strcat
extern	_ft_strlen

_ft_strcat:
	push rbp
	mov rbp, rsp
	call _ft_strlen
	xor rcx, rcx

_while:
	cmp byte[rsi + rcx], 0x0
	jz _exit
	mov r8b, byte[rsi + rcx]
	mov byte[rdi + rax], r8b
	inc rcx
	inc rax
	jmp _while

_exit:
	mov byte[rdi + rax], 0x0
	mov rax, rdi
	mov rsp, rbp
	pop rbp
	ret
