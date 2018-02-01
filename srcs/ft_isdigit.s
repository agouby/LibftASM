global	_ft_isdigit

_ft_isdigit:
	push rbp
	mov	rbp, rsp
	cmp rdi, 0x30
	jl	_fail
	cmp rdi, 0x39
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
