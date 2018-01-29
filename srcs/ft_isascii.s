global	ft_isascii

ft_isascii:
	and rdi, rdi
	jl _fail
	cmp rdi, 127
	jg _fail
	jmp _success

_fail:
	mov rax, 0
	ret

_success:
	mov rax, 1
	ret
