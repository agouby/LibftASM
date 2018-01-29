global ft_isdigit

ft_isdigit:
	cmp rdi, 48
	jl _fail
	cmp rdi, 57
	jg _fail
	jmp _success

_fail:
	mov rax, 0
	ret

_success:
	mov rax, 1
	ret
