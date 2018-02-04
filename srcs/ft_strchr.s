global	_ft_strchr

_ft_strchr:
	push rbp
	mov rbp, rsp

_while:
	cmp byte[rdi], 0x0
	je	_end
	cmp sil, byte[rdi]
	je	_success
	inc rdi
	jmp _while

_success:
	mov rax, rdi
	jmp	_exit

_fail:
	mov rax, 0x0
	jmp	_exit

_end:
	cmp sil, 0x0
	je	_success
	jmp	_fail

_exit:
	mov rbp, rsp
	pop rbp
	ret
