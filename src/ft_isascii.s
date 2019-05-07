global	_ft_isascii

_ft_isascii:
	push rbp
	mov	rbp, rsp
	and rdi, rdi
	js	_fail
	cmp rdi, 0x7F
	jle _success
	jmp _fail

_success:
	mov rax, 0x1
	jmp _exit

_fail:
	xor rax, rax
	jmp _exit

_exit:
	mov	rsp, rbp
	pop rbp
	ret
