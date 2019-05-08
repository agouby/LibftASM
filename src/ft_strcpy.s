section .text
global _ft_strcpy

_ft_strcpy:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	push rdi
	
_while:
	mov al, [rsi + rcx]
	and al, al
	je _exit
	mov [rdi + rcx], al
	inc rcx
	jmp _while

_exit:
	pop rax
	mov byte[rdi + rcx], 0x0
	mov rsp, rbp
	pop rbp
	ret
