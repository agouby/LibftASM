global	_ft_tolower

_ft_tolower:
	push rbp
	mov rbp, rsp
	mov eax, edi
	cmp rdi, 0x41
	jl _fail
	cmp rdi, 0x5A
	jg _fail
	jmp _success
	
_fail:
	jmp _exit

_success:
	add eax, 0x20
	jmp _exit

_exit:
	mov rsp, rbp
	pop rbp
	ret
