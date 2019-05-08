section .text
global	_ft_strcmp

_ft_strcmp:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	xor rax, rax
	xor rbx, rbx

_while:
	mov al, [rdi + rcx]
	mov bl, [rsi + rcx]
	and al, al
	je	_test
	cmp al, bl
	jne	_test
	inc rcx
	jmp	_while

_test:
	sub rax, rbx
	jmp	_exit

_exit:
	mov rsp, rbp
	pop rbp
	ret
