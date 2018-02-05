global	_ft_strlen

_ft_strlen:
	push rbp
	mov rbp, rsp
	xor rax, rax

_while:
	mov dl, [rdi + rax]
	and dl, dl
	je	_exit
	inc rax
	jmp	_while

_exit:
	mov rsp, rbp
	pop rbp
	ret
