section .text
global	_ft_strequ

_ft_strequ:
	push rbp
	mov rbp, rsp
	xor rcx, rcx
	xor rax, rax
	xor rdx, rdx
	xor rbx, rbx

_while:
	mov dl, [rdi + rcx]
	mov bl, [rsi + rcx]
	and dl, dl
	je	_test
	cmp dl, bl
	jne	_test
	inc rcx
	jmp	_while

_test:
	cmp dl,bl
	jne	_exit
	mov rax,1

_exit:
	mov rsp, rbp
	pop rbp
	ret
