global	_ft_isprint

_ft_isprint:
	push rbp
	mov	rbp, rsp
	cmp rdi, 0x20
	jl	_fail
	cmp rdi, 0x7e
	jle _success
	jmp _fail

_success:
	mov rax, 0x1
	jmp _exit

_fail:
	xor rax, rax
	jmp	_exit

_exit:
	mov	rsp, rbp
	pop rbp
	ret
