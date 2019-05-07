global	_ft_islower

_ft_islower:
	push rbp
	mov rbp, rsp
	cmp rdi, 0x61
	jl _fail
	cmp rdi, 0x7A
	jg _fail
	jmp _success
	
_fail:
	xor eax, eax
	jmp _exit

_success:
	mov eax, 0x1
	jmp _exit

_exit:
	mov rsp, rbp
	pop rbp
	ret
