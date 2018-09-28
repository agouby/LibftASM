global	_ft_strcmp

section .text

_ft_strcmp:
	xor rcx, rcx
	xor rax, rax
	xor rdx, rdx
	xor rbx, rbx

_while:
	mov dl, [rdi + rcx]
	mov bl, [rsi + rcx]
	and dl, dl
	je	_test
	and bl, bl
	je	_test
	cmp dl, bl
	jne	_test
	inc rcx
	jmp	_while

_test:
	sub rdx, rbx
	mov rax, rdx
	jmp	_exit

_exit:
	ret
